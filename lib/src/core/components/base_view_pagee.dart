import 'package:flutter/material.dart';
import 'package:market_list_my_bloc/src/core/theme/app_dimension.dart';

class BaseViewPage extends StatelessWidget {
  const BaseViewPage({
    Key? key,
    required this.children,
    this.center = true,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  }) : super(key: key);

  final bool? center;
  final List<Widget> children;
  final CrossAxisAlignment? crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppDimension.size_2,
        horizontal: AppDimension.size_3,
      ),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: center! ? MainAxisAlignment.center : MainAxisAlignment.start,
          crossAxisAlignment: crossAxisAlignment!,
          children: [
            ...children,
          ],
        ),
      ),
    );
  }
}
