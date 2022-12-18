part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}

class RegisterUserEvent extends RegisterEvent {
  final String username;
  final String email;
  final String password;
  RegisterUserEvent({
    required this.password,
    required this.email,
    required this.username,
  });
}
