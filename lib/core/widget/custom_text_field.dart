import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/theme/app_color.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final String? label;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixTap;
  final Color? borderColor;
  final int maxLines;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboard;
  final bool? obscure;
  final String? obscureCharacter;
  final void Function(String)? onChanged;

  const CustomTextField({
    super.key,
    required this.hint,
    this.controller,
    this.borderColor,
    this.validator,
    this.maxLines = 1,
    this.keyboard,
    this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.obscure = false,
    this.obscureCharacter,
    this.onChanged,
    this.onSuffixTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: AppStyle.font18BlackRegular,
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      obscureText: obscure!,
      obscuringCharacter: obscureCharacter ?? "*",
      maxLines: maxLines,
      cursorColor: AppColor.primaryBlueColor,
      cursorHeight: 23,
      cursorWidth: 2,
      keyboardType: keyboard ?? TextInputType.text,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: AppStyle.font14GrayRegular,
        labelText: label,
        labelStyle: AppStyle.font14GrayRegular,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 18,
        ),
        enabledBorder: builtBorder(AppColor.transparentColor),
        focusedBorder: builtBorder(AppColor.primaryBlueColor),
        errorBorder: builtBorder(),
        focusedErrorBorder: builtBorder(),
        prefixIcon: Icon(prefixIcon),
        prefixIconColor: AppColor.grayColor,
        suffixIcon: suffixIcon != null
            ? GestureDetector(onTap: onSuffixTap, child: Icon(suffixIcon))
            : null,
        suffixIconColor: AppColor.grayColor,
        filled: true,
        fillColor: AppColor.whiteDarkColor,
      ),
    );
  }

  OutlineInputBorder builtBorder([
    Color colorBorder = AppColor.primaryPurpleColor,
  ]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: colorBorder, width: 1.2),
    );
  }
}
