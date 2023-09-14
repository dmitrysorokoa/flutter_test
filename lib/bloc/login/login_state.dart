part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

class LoginInitial extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginProcessing extends LoginState {
  final String login;
  final String password;
  LoginProcessing({required this.login, required this.password});
}
