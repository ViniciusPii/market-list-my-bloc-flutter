import 'package:flutter/material.dart';
import 'package:market_list_my_bloc/src/core/theme/app_dimension.dart';

class BaseViewPage extends StatelessWidget {
  const BaseViewPage({
    Key? key,
    required this.children,
    this.center = true,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  }) : super(key: key);

  final bool? center;
  final List<Widget> children;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppDimension.size_2,
          horizontal: AppDimension.size_3,
        ),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: mainAxisAlignment!,
            crossAxisAlignment: crossAxisAlignment!,
            children: [
              ...children,
            ],
          ),
        ),
      ),
    );
  }
}
