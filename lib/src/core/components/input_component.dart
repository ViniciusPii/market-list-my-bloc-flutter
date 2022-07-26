import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputComponent extends StatelessWidget {
  const InputComponent({
    Key? key,
    required this.label,
    required this.validator,
    this.suffix,
    this.controller,
    this.keyboardType,
    this.inputFormatters,
    this.onFieldSubmitted,
    this.obscured = false,
    this.capitalization = true,
    this.textInputAction = TextInputAction.next,
  }) : super(key: key);

  final String label;
  final bool obscured;
  final String? suffix;
  final bool? capitalization;
  final TextInputType? keyboardType;
  final TextInputAction textInputAction;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        isDense: true,
        label: Text(label),
        suffixText: suffix,
        border: const OutlineInputBorder(),
      ),
      autofocus: true,
      validator: validator,
      obscureText: obscured,
      controller: controller,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      textInputAction: textInputAction,
      onFieldSubmitted: onFieldSubmitted,
      textCapitalization: capitalization! ? TextCapitalization.sentences : TextCapitalization.none,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
