import 'package:injectable/injectable.dart';
import 'package:user_explorer/data/service/json_placeholder_user_service.dart';

import '../../domain/repository/user_repository.dart';
import '../model/user_model.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final JsonPlaceholderUserService _jsonPlaceholderUserService;

  UserRepositoryImpl(JsonPlaceholderUserService jsonPlaceholderUserService)
    : _jsonPlaceholderUserService = jsonPlaceholderUserService;

  @override
  Future<List<UserModel>> getUsers() => _jsonPlaceholderUserService.getUsers();
}
