part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationEvent {}


class SignUpEvent extends AuthenticationEvent {
  final String name;
  final String email;
  final String password;

  SignUpEvent({required this.name,required this.email, required this.password});
}

class LoginEvent extends AuthenticationEvent {
  final String email;
  final String password;

  LoginEvent({required this.password, required this.email});
}