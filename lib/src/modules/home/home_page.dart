import 'package:flutter/material.dart';
import 'package:market_list_my_bloc/src/core/components/base_view_pagee.dart';
import 'package:market_list_my_bloc/src/core/components/circle_avatar_component.dart';
import 'package:market_list_my_bloc/src/core/theme/app_colors.dart';
import 'package:market_list_my_bloc/src/core/theme/app_dimension.dart';
import 'package:market_list_my_bloc/src/core/theme/app_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseViewPage(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildHeader(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.only(top: AppDimension.size_1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Olá!',
                  style: AppFonts.headlineSmall(),
                ),
                Text(
                  'Seja bem-vindo(a)',
                  style: AppFonts.bodyLarge(light: true),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: AppDimension.size_2,
          ),
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  AppDimension.size_4,
                ),
              ),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: AppColors.neutral,
                  blurRadius: 10,
                  offset: Offset(3, 3),
                ),
              ],
            ),
            child: GestureDetector(
              onTap: () {},
              child: const CircleAvatarComponent(
                url: '',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
