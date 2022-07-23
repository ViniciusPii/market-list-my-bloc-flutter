part of 'splash_bloc.dart';

abstract class SplashState {
  SplashState();
}

class SplashInitial extends SplashState {
  SplashInitial() : super();
}

class SplashLoading extends SplashState {
  SplashLoading() : super();
}

class SplashSuccess extends SplashState {
  SplashSuccess() : super();
}

class SplashError extends SplashState {
  SplashError({
    required this.message,
  }) : super();

  final String message;
}
