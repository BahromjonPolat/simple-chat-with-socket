part of 'users_bloc.dart';

@immutable
abstract class UsersState {}

class UsersInitial extends UsersState {}

class UsersLoadingState extends UsersState {}

class UsersFailedState extends UsersState {
  final String error;
  UsersFailedState(this.error);
}

class UsersSuccessState extends UsersState {
  final List<UserModel> users;
  UsersSuccessState(this.users);
}
