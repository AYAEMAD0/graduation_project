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
  final LinearGradient? gradient;
  final Color? colorBackGround;
  final bool isOutline;
  final Color? outlineColor;
  final double outlineWidth;

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
    this.gradient,
    this.styleText,
    this.colorBackGround,
    this.isOutline = false,
    this.outlineColor,
    this.outlineWidth = 1.5,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveBorderRadius = borderRadius ?? 20.0;
    final borderRadiusGeometry = BorderRadius.circular(effectiveBorderRadius);

    return InkWell(
      onTap: onPressed,
      borderRadius: borderRadiusGeometry,
      child: Container(
        height: height ?? 54,
        width: widthBtn ?? 380,
        decoration: BoxDecoration(
          color: isOutline ? Colors.transparent : colorBackGround,
          gradient: isOutline
              ? null
              : (colorBackGround != null
                    ? null
                    : (gradient ?? AppGradient.primaryGradient)),
          borderRadius: borderRadiusGeometry,
          border: isOutline
              ? Border.all(
                  color:
                      outlineColor ?? AppGradient.primaryGradient.colors.first,
                  width: outlineWidth,
                )
              : null,
          boxShadow: hasShadow && !isOutline
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
            Center(
              child: Text(
                text ?? "",
                style:
                    styleText ??
                    (isOutline
                        ? AppStyle.font18WhiteBold.copyWith(
                            color:
                                outlineColor ??
                                AppGradient.primaryGradient.colors.first,
                          )
                        : AppStyle.font18WhiteBold),
              ),
            ),
      ),
    );
  }
}