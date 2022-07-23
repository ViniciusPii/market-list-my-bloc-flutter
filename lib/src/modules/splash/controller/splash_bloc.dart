import 'package:firebase_auth/firebase_auth.dart';
import 'package:market_list_my_bloc/src/core/infra/navigator/app_navigator.dart';
import 'package:market_list_my_bloc/src/routes/routes.dart';

import '/src/core/infra/bloc.dart';

part 'splash_state.dart';

class SplashBloc extends Bloc<SplashState> {
  SplashBloc({
    required FirebaseAuth firebaseAuth,
  })  : _firebaseAuth = firebaseAuth,
        super(SplashInitial());

  final FirebaseAuth _firebaseAuth;

  Future<void> checkAuth() async {
    _firebaseAuth.userChanges().listen(
      (user) {
        if (user != null) {
          AppNavigator.to.pushNamedAndRemoveUntil(Routes.home, (route) => false);
        } else {
          AppNavigator.to.pushNamedAndRemoveUntil(Routes.login, (route) => false);
        }
      },
    );
  }
}
