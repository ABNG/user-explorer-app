part of 'user_cubit.dart';

sealed class UserState extends Equatable {
  const UserState();
}

final class UserLoading extends UserState {
  @override
  List<Object> get props => [];
}

final class UserData extends UserState {
  final List<UserModel> users;
  const UserData({required this.users});
  @override
  List<Object> get props => [users];
}

final class UserError extends UserState {
  final String message;
  const UserError({required this.message});
  @override
  List<Object> get props => [message];
}

final class UserEmpty extends UserState {
  final String message;
  const UserEmpty({required this.message});
  @override
  List<Object> get props => [message];
}
