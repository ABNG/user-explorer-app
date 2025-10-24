import 'package:injectable/injectable.dart';
import 'package:user_explorer/data/service/json_placeholder_user_service.dart';

import '../../domain/repository/user_repository.dart';
import '../model/user_model.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final JsonPlaceholderUserService _jsonPlaceholderUserService;
  final List<UserModel> _cachedUsers = [];

  UserRepositoryImpl(JsonPlaceholderUserService jsonPlaceholderUserService)
    : _jsonPlaceholderUserService = jsonPlaceholderUserService;

  @override
  Future<List<UserModel>> getUsers() async {
    try {
      final usersList = await _jsonPlaceholderUserService.getUsers();
      _cachedUsers.clear();
      _cachedUsers.addAll(usersList);
      return usersList;
    } catch (e) {
      rethrow;
    }
  }

  @override
  List<UserModel> filterUsers(String query) {
    if (query.isEmpty) {
      return _cachedUsers;
    }
    final filteredUsers = _cachedUsers
        .where(
          (user) =>
              user.name?.toLowerCase().contains(query.toLowerCase()) ?? false,
        )
        .toList();
    return filteredUsers;
  }
}
