part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class LoginButtonTappedEvent extends LoginEvent {
  final String login;
  final String password;
  LoginButtonTappedEvent({required this.login, required this.password});
}
class LogoutButtonTappedEvent extends LoginEvent {}