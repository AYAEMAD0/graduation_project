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
  final Color? cursorColor;
  final TextStyle? textStyle;

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
    this.cursorColor,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final resolvedTextStyle =
        textStyle ??
        (isDark
            ? AppStyle.font18BlackRegular.copyWith(color: Colors.white)
            : AppStyle.font18BlackRegular);

    final resolvedHintStyle =
        hintStyle ??
            (isDark
                ? AppStyle.font14GrayRegular.copyWith(color: Colors.white.withOpacity(0.4))
                : AppStyle.font14GrayRegular);

    final resolvedLabelStyle =
        labelStyle ??
            (isDark
                ? AppStyle.font14GrayRegular.copyWith(color: Colors.white.withOpacity(0.7))
                : AppStyle.font14GrayRegular);

    final resolvedFillColor =
        fillColor ??
        (isDark
            ? Colors.white.withValues(alpha: 0.05)
            : AppColor.whiteDarkColor);

    final resolvedPrefixStyle = isDark
        ? AppStyle.font18BlackRegular.copyWith(color: Colors.white)
        : AppStyle.font18BlackRegular;

    return TextFormField(
      style: resolvedTextStyle,
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
        hintStyle: resolvedHintStyle,
        labelText: label,
        labelStyle: resolvedLabelStyle,
        contentPadding:
            contentPadding ??
            const EdgeInsets.symmetric(horizontal: 10, vertical: 20),

        border: builtBorder(
          borderColor ??
              (isDark ? Colors.transparent : AppColor.transparentColor),
        ),
        enabledBorder: builtBorder(
          borderColor ?? (isDark ? Colors.white10 : AppColor.transparentColor),
        ),
        focusedBorder: builtBorder(
          borderFocuseColor ?? AppColor.primaryBlueColor,
        ),
        errorBorder: builtBorder(),
        focusedErrorBorder: builtBorder(),

        prefixText: prefixText,
        prefixStyle: resolvedPrefixStyle,
        prefixIcon: prefixIcon != null
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Icon(prefixIcon),
              )
            : null,
        isDense: true,
        prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
        prefixIconColor: isDark ? Colors.white60 : AppColor.grayColor,

        suffixIcon: suffixIcon != null
            ? GestureDetector(
                onTap: onSuffixTap,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Icon(suffixIcon),
                ),
              )
            : null,
        suffixIconColor: isDark ? Colors.white60 : AppColor.grayColor,
        filled: true,
        fillColor: resolvedFillColor,
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
