import 'package:market_list_my_bloc/src/core/exceptions/app_exception.dart';
import 'package:market_list_my_bloc/src/repositories/auth/auth_repository.dart';

import '/src/core/infra/bloc.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginState> {
  LoginBloc({
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(LoginInitial());

  final AuthRepository _authRepository;

  Future<void> signInWithGoogle() async {
    emit(LoginLoading());

    try {
      await _authRepository.signInWithGoogle();
      emit(LoginSuccess());
    } on AppException catch (e) {
      emit(LoginError(message: e.message));
    }
  }
}
