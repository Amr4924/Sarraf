import 'package:flutter/material.dart';
import 'package:sarraf/core/theming/style.dart';

class AppTextField extends StatelessWidget {
  final bool? autofocus;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final TextAlign? textAlign;
  final TextInputType? keyboardType;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? contentPadding;
  final String? hintText;
  final InputBorder? inputBorder;
  const AppTextField({
    super.key,
    this.autofocus,
    this.controller,
    this.onChanged,
    this.textAlign,
    this.keyboardType,
    this.textStyle,
    this.contentPadding,
    this.hintText,
    this.inputBorder,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: autofocus ?? false,
      controller: controller,
      textAlign: textAlign ?? TextAlign.start,
      keyboardType:
          keyboardType ?? TextInputType.numberWithOptions(decimal: true),
      onChanged: onChanged,
      style:
          textStyle ??
          const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
        hintText: hintText ?? "0.0",
        suffixText: "g",
        suffixStyle: TextStyles.font17TextSecondrySemiBold(context),
        labelStyle: TextStyles.font13ScondaryMedium(context),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: inputBorder ?? InputBorder.none,
        isDense: true,
        contentPadding: contentPadding ?? EdgeInsets.zero,
      ),
    );
  }
}
