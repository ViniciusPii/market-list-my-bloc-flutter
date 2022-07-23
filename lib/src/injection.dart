import 'package:market_list_my_bloc/src/core/infra/di/dependon.dart';
import 'package:market_list_my_bloc/src/modules/splash/controller/splash_bloc.dart';

Dependon get di => Dependon.instance;

injection() {
  //repositories

  //controllers
  di.registerFactory(() => SplashBloc());
}
