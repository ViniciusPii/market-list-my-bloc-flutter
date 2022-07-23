import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:market_list_my_bloc/src/core/infra/components/page_widget.dart';
import 'package:market_list_my_bloc/src/core/theme/app_dimension.dart';
import 'package:market_list_my_bloc/src/core/theme/app_extension.dart';
import 'package:market_list_my_bloc/src/modules/splash/controller/splash_bloc.dart';

class SplashPage extends PageWidget<SplashBloc> {
  SplashPage({Key? key}) : super(key: key);

  @override
  void onInit(BuildContext context) {
    super.onInit(context);
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        await Future.delayed(const Duration(seconds: 2));
        bloc.checkAuth();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
        systemNavigationBarColor: AppExtension.primary,
      ),
      child: Scaffold(
        backgroundColor: AppExtension.primary,
        body: Center(
          child: Image.asset(
            'assets/images/splash.png',
            height: AppDimension.size_10,
          ),
        ),
      ),
    );
  }
}
