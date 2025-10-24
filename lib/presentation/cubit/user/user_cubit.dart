import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_explorer/core/error/app_exception.dart';
import 'package:user_explorer/data/model/user_model.dart';

import '../../../domain/repository/user_repository.dart';

part "user_state.dart";

class UserCubit extends Cubit<UserState> {
  final UserRepository userRepository;
  UserCubit({required this.userRepository}) : super(UserLoading());

  Future<void> getUsers() async {
    emit(UserLoading());
    try {
      final users = await userRepository.getUsers();

      if (users.isEmpty) {
        emit(UserEmpty(message: "No users found"));
      } else {
        emit(UserData(users: users));
      }
    } on AppException catch (e) {
      emit(UserError(message: e.message));
    } catch (e) {
      log(e.toString());
      emit(UserError(message: "Unexpected error occurred"));
    }
  }

  void filterUsers(String query) {
    if (state is! UserData) {
      return;
    }
    final filterUsers = userRepository.filterUsers(query);

    emit(UserData(users: filterUsers));
  }
}
