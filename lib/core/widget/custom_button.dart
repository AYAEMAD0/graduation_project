import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/theme/app_gradient.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final TextStyle? styleText;
  final VoidCallback? onPressed;
  final double? widthBtn;
  final double? height;
  final double? borderRadius;
  final bool hasShadow;
  final IconData? icon;

  final Widget? child;
  const CustomButton({
    super.key,
    this.text,
    required this.onPressed,
    this.widthBtn,
    this.height,
    this.borderRadius,
    this.hasShadow = false,
    this.icon,
    this.child,
    this.styleText
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(borderRadius ?? 20),
      child: Container(
        height: height ?? 54,
        width: widthBtn ?? 380,
        decoration: BoxDecoration(
          gradient: AppGradient.primaryGradient,
          borderRadius: BorderRadius.circular(borderRadius ?? 20),
          boxShadow: hasShadow
              ? [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.15),
                    blurRadius: 18,
                    offset: const Offset(0, 8),
                  ),
                ]
              : null,
        ),
        child:
            child ??
                Center(child: Text(
                    text ?? "", style: styleText ?? AppStyle.font18WhiteBold)),
      ),
    );
  }
}
