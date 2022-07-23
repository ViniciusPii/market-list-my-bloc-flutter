import 'package:firebase_auth/firebase_auth.dart';
import 'package:market_list_my_bloc/src/core/infra/di/dependon.dart';
import 'package:market_list_my_bloc/src/modules/auth/controller/login_bloc.dart';
import 'package:market_list_my_bloc/src/modules/splash/controller/splash_bloc.dart';
import 'package:market_list_my_bloc/src/repositories/auth/auth_repository.dart';
import 'package:market_list_my_bloc/src/repositories/auth/auth_repository_impl.dart';

Dependon get di => Dependon.instance;

injection() {
  //services
  di.registerLazySingleton(() => FirebaseAuth.instance);

  //repositories
  di.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      firebaseAuth: get(),
    ),
  );

  //controllers
  di.registerFactory(() => SplashBloc());
  di.registerFactory(() => LoginBloc(authRepository: get()));
}
