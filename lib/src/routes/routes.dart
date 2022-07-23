import 'package:flutter/material.dart';
import 'package:market_list_my_bloc/src/modules/auth/login_page.dart';
import 'package:market_list_my_bloc/src/modules/home/home_page.dart';
import 'package:market_list_my_bloc/src/modules/splash/splash_page.dart';

class Routes {
  static const String splash = '/';
  static const String home = '/home';
  static const String login = '/login';

  late final routes = <String, WidgetBuilder>{
    login: (context) => LoginPage(),
    splash: (context) => SplashPage(),
    home: (context) => const HomePage(),
  };

  T getParans<T>(BuildContext context) => ModalRoute.of(context)?.settings.arguments as T;
}
