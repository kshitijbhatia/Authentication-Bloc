part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationState{}

final class AuthenticationInitial extends AuthenticationState {}

final class AuthenticationLoading extends AuthenticationState {}

final class AuthenticationSuccess extends AuthenticationState {}

final class AuthenticationFailure extends AuthenticationState {
  final String error;

  AuthenticationFailure(this.error);
}