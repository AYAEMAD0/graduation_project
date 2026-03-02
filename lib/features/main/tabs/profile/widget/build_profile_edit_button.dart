import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../../core/theme/app_style.dart';
import '../../../../../core/widget/custom_button.dart';

class BuildProfileEditButton extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onPressed;

  const BuildProfileEditButton({
    super.key,
    required this.isLoading,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    return CustomButton(
      widthBtn: isMobile ? 150 : 300,
      onPressed: isLoading ? null : onPressed,
      child: isLoading
          ? const Center(
              child: SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2.5,
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Text(
                "Edit",
                style: AppStyle.font18WhiteBold,
                textAlign: TextAlign.center,
              ),
            ),
    );
  }
}
