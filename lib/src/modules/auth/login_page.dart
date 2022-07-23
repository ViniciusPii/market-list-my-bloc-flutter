import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:market_list_my_bloc/src/core/components/base_view_pagee.dart';
import 'package:market_list_my_bloc/src/core/components/loader_component.dart';
import 'package:market_list_my_bloc/src/core/components/snackbar_component.dart';
import 'package:market_list_my_bloc/src/core/infra/components/bloc_consumer.dart';
import 'package:market_list_my_bloc/src/core/infra/components/page_widget.dart';
import 'package:market_list_my_bloc/src/core/theme/app_dimension.dart';
import 'package:market_list_my_bloc/src/core/theme/app_fonts.dart';
import 'package:market_list_my_bloc/src/modules/auth/controller/login_bloc.dart';

class LoginPage extends PageWidget<LoginBloc> {
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseViewPage(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildImage(),
          _buildLogin(),
        ],
      ),
    );
  }

  Widget _buildImage() => Image.asset('assets/images/login.png');

  Widget _buildLogin() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Login',
          style: AppFonts.titleLarge(),
        ),
        const SizedBox(
          height: AppDimension.size_0,
        ),
        Text(
          'Faça seu login com o Google! É rápido, fácil e você já poderá iniciar suas compras!',
          style: AppFonts.bodyLarge(light: true),
        ),
        const SizedBox(
          height: AppDimension.size_5,
        ),
        BlocConsumer<LoginBloc, LoginState>(
          bloc: bloc,
          listener: (context, state) {
            if (state is LoginError) {
              SnackbarComponent.error(context, message: state.message);
            }
          },
          builder: (context, state) {
            return LoaderComponent(
              loading: state is LoginLoading,
              child: ElevatedButton.icon(
                label: const Text('Login com o Google'),
                onPressed: () => bloc.signInWithGoogle(),
                icon: const Icon(FontAwesomeIcons.google),
              ),
            );
          },
        ),
      ],
    );
  }
}
