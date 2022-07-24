import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:market_list_my_bloc/src/core/components/alert_dialog_component.dart';
import 'package:market_list_my_bloc/src/core/components/base_view_pagee.dart';
import 'package:market_list_my_bloc/src/core/components/card_product_component.dart';
import 'package:market_list_my_bloc/src/core/components/circle_avatar_component.dart';
import 'package:market_list_my_bloc/src/core/infra/components/page_widget.dart';
import 'package:market_list_my_bloc/src/core/infra/di/dependon.dart';
import 'package:market_list_my_bloc/src/core/theme/app_colors.dart';
import 'package:market_list_my_bloc/src/core/theme/app_dimension.dart';
import 'package:market_list_my_bloc/src/core/theme/app_extension.dart';
import 'package:market_list_my_bloc/src/core/theme/app_fonts.dart';
import 'package:market_list_my_bloc/src/core/utils/formatters/app_formatters.dart';
import 'package:market_list_my_bloc/src/models/product_model.dart';
import 'package:market_list_my_bloc/src/modules/home/controller/home_bloc.dart';
import 'package:market_list_my_bloc/src/repositories/auth/auth_repository.dart';

class HomePage extends PageWidget<HomeBloc> {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseViewPage(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildHeader(),
          _buildPurchaseInfo(),
          _buildItemCount(context),
          _buildListView(),
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
                  'Olá! ${bloc.user.displayName}',
                  style: AppFonts.titleLarge(),
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
              onTap: () => get<AuthRepository>().signOut(),
              child: CircleAvatarComponent(
                url: '${bloc.user.photoURL}',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPurchaseInfo() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AppDimension.spacing_6,
          Text(
            'Valor total',
            style: AppFonts.bodyMedium(
              light: true,
            ),
          ),
          Text(
            AppFormatters.moneyFormat(255),
            style: AppFonts.headlineSmall(
              color: AppExtension.primary,
            ),
          ),
          AppDimension.spacing_6,
        ],
      ),
    );
  }

  Widget _buildItemCount(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              '1 item no seu carrinho',
              style: AppFonts.titleMedium(),
            ),
            IconButton(
              onPressed: () => showDialog<AlertDialog>(
                context: context,
                builder: (BuildContext context) => AlertDialogComponent(
                  title: 'Atenção!',
                  content: 'Você deseja realmente excluir todos itens da lista?',
                  primaryButtonText: 'Não',
                  primaryFunction: () => Navigator.pop(context),
                  secondaryButtonText: 'Sim',
                  secondaryFunction: () {},
                ),
              ),
              icon: const Icon(
                FontAwesomeIcons.solidTrashCan,
                color: AppExtension.primary,
                size: AppDimension.size_3,
              ),
            )
          ],
        ),
        AppDimension.spacing_1,
      ],
    );
  }

  Widget _buildListView() {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          return CardProductComponent(
            productModel: ProductModel(
              productName: 'Teste',
              price: 2.50,
              quantity: 1,
              fullPrice: 5,
              isSelected: true,
              timestamp: DateTime.now(),
              weight: 0.25,
            ),
            action: () {},
          );
        },
        itemCount: 5,
        separatorBuilder: (_, __) => AppDimension.spacing_1,
      ),
    );
  }
}
