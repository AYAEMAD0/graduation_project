import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/theme/app_gradient.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;
  final double? widthBtn;
  final Widget? child;
  final double? radius;
  const CustomButton({
    super.key,
    this.text,
    required this.onPressed,
    this.widthBtn,
    this.child,
    this.radius,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(radius ?? 36),
      child: Container(
        height: 54,
        width: widthBtn ?? 250,
        decoration: BoxDecoration(
          gradient: AppGradient.primaryGradient,
          borderRadius: BorderRadius.circular(radius ?? 36),
        ),
        child:
            child ??
            Center(child: Text(text ?? "", style: AppStyle.font18WhiteBold)),
      ),
    );
  }
}
