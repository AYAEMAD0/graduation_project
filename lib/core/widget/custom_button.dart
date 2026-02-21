import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/theme/app_gradient.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? widthBtn;
  final double? height;
  final double? borderRadius;
  final bool hasShadow;
  final IconData? icon;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.widthBtn,
    this.height,
    this.borderRadius,
    this.hasShadow = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final double finalHeight = height ?? 54;
    final double finalRadius = borderRadius ?? 36;

    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(finalRadius),
      child: Container(
        height: finalHeight,
        width: widthBtn ?? 250,
        decoration: BoxDecoration(
          gradient: AppGradient.primaryGradient,
          borderRadius: BorderRadius.circular(finalRadius),
          boxShadow: hasShadow
              ? [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 18,
              offset: const Offset(0, 8),
            ),
          ]
              : null,
        ),
        child: Center(
          child: Text(
            text,
            style: AppStyle.font18WhiteBold,
          ),
        ),
      ),
    );
  }
}