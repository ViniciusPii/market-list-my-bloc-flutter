part of 'login_bloc.dart';

abstract class LoginState {
  LoginState();
}

class LoginInitial extends LoginState {
  LoginInitial() : super();
}

class LoginLoading extends LoginState {
  LoginLoading() : super();
}

class LoginSuccess extends LoginState {
  LoginSuccess() : super();
}

class LoginError extends LoginState {
  LoginError({
    required this.message,
  }) : super();

  final String message;
}
