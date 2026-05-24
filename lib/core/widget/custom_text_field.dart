import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';

import '../theme/app_color.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final String? label;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;

  final String? prefixText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixTap;
  final Widget? prefixWidget;

  final Color? borderColor;
  final Color? borderFocuseColor;
  final int maxLines;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboard;
  final bool? obscure;
  final String? obscureCharacter;
  final void Function(String)? onChanged;
  final Color? fillColor;
  final EdgeInsetsGeometry? contentPadding;
  final Color?cursorColor;

  const CustomTextField({
    super.key,
    required this.hint,
    this.controller,
    this.borderColor,
    this.validator,
    this.maxLines = 1,
    this.keyboard,
    this.label,
    this.prefixText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscure = false,
    this.obscureCharacter,
    this.onChanged,
    this.onSuffixTap,
    this.fillColor,
    this.contentPadding,
    this.hintStyle,
    this.labelStyle,
    this.borderFocuseColor,
    this.cursorColor, this.prefixWidget,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: AppStyle.font18BlackRegular,
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      autofocus: false,
      obscureText: obscure!,
      obscuringCharacter: obscureCharacter ?? "*",
      maxLines: maxLines,
      cursorColor: cursorColor ?? AppColor.primaryBlueColor,
      cursorHeight: 23,
      cursorWidth: 3,
      keyboardType: keyboard ?? TextInputType.text,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: hintStyle ?? AppStyle.font14GrayRegular,
        labelText: label,
        labelStyle: labelStyle ?? AppStyle.font14GrayRegular,
        contentPadding:
            contentPadding ??
            EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        border: builtBorder(borderColor ?? AppColor.transparentColor),
        enabledBorder: builtBorder(borderColor ?? AppColor.transparentColor),
        focusedBorder: builtBorder(
            borderFocuseColor ?? AppColor.primaryBlueColor),
        errorBorder: builtBorder(),
        focusedErrorBorder: builtBorder(),
        prefixText: prefixText,
        prefixStyle: AppStyle.font18BlackRegular,
        prefixIcon: prefixWidget ??
            (prefixIcon != null
                ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Icon(prefixIcon),
            )
                : null),
        isDense: true,
        prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
        prefixIconColor: AppColor.grayColor,
        suffixIcon: suffixIcon != null
            ? GestureDetector(onTap: onSuffixTap, child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Icon(suffixIcon),
        ))
            : null,
        suffixIconColor: AppColor.grayColor,
        filled: true,
        fillColor: fillColor ?? AppColor.whiteDarkColor,
      ),
    );
  }

  OutlineInputBorder builtBorder([
    Color colorBorder = AppColor.primaryPurpleColor,
  ]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: colorBorder, width: 1.5),
    );
  }
}
