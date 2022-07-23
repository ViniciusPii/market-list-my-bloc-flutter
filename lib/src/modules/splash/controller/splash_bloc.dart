import '/src/core/infra/bloc.dart';

part 'splash_state.dart';

class SplashBloc extends Bloc<SplashState> {
  SplashBloc() : super(SplashInitial());
}
