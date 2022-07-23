import 'package:flutter/material.dart';
import 'package:market_list_my_bloc/src/modules/splash/splash_page.dart';

class Routes {
  static const String splash = '/';

  late final routes = <String, WidgetBuilder>{
    splash: (context) => const SplashPage(),
  };

  T getParans<T>(BuildContext context) => ModalRoute.of(context)?.settings.arguments as T;
}
