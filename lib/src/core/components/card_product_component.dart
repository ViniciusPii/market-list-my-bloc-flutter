import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:market_list_my_bloc/src/core/theme/app_colors.dart';
import 'package:market_list_my_bloc/src/core/theme/app_dimension.dart';
import 'package:market_list_my_bloc/src/core/theme/app_extension.dart';
import 'package:market_list_my_bloc/src/core/theme/app_fonts.dart';
import 'package:market_list_my_bloc/src/core/utils/formatters/app_formatters.dart';
import 'package:market_list_my_bloc/src/models/product_model.dart';

class CardProductComponent extends StatelessWidget {
  const CardProductComponent({
    Key? key,
    required this.productModel,
    required this.action,
  }) : super(key: key);

  final ProductModel productModel;
  final Function() action;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: const <BoxShadow>[
            BoxShadow(
              color: AppColors.neutral200,
              blurRadius: 10,
              offset: Offset(1, 5),
            ),
          ],
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppDimension.size_1),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppDimension.size_1,
            horizontal: AppDimension.size_2,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: AppExtension.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(AppDimension.size_2),
                      ),
                      child: const Icon(
                        FontAwesomeIcons.basketShopping,
                        color: AppExtension.primary,
                      ),
                    ),
                    const SizedBox(width: AppDimension.size_2),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            productModel.productName,
                            style: AppFonts.titleMedium(),
                          ),
                          Text(
                            _changeText(),
                            style: AppFonts.bodyMedium(),
                          ),
                          AppDimension.spacing_0,
                          Text(
                            productModel.isSelected
                                ? '${AppFormatters.moneyFormat(productModel.price)} Kg'
                                : '${AppFormatters.moneyFormat(productModel.price)} cada',
                            style: AppFonts.bodySmall(color: AppExtension.primary),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              AppDimension.spacing_2,
              Container(
                decoration: BoxDecoration(
                  color: AppExtension.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppDimension.size_2),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: AppDimension.size_1,
                    horizontal: AppDimension.size_2,
                  ),
                  child: Text(
                    AppFormatters.moneyFormat(productModel.fullPrice),
                    style: AppFonts.labelLarge(
                      color: AppExtension.primary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _changeText() {
    if (productModel.quantity > 1) {
      return '${productModel.quantity} unidades';
    } else if (productModel.isSelected) {
      if (productModel.weight >= 1) {
        return '${productModel.weight} Kg';
      } else {
        return '${AppFormatters.gramsFormat(productModel.weight)} gramas';
      }
    }
    return '${productModel.quantity} unidade';
  }
}
