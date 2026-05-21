import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../../core/theme/app_style.dart';
import '../../../../../core/widget/custom_button.dart';
import '../../../../../core/widget/custom_dialog.dart';

class BuildProfileLogoutButton extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onPressed;

  const BuildProfileLogoutButton({
    super.key,
    required this.isLoading,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    return CustomButton(
      widthBtn: isMobile ? 150 : 300,
      onPressed: isLoading
          ? null
          : () async {
              final confirm = await CustomDialog.showConfirm(
                context: context,
                title: "Confirm Logout",
                message: "Are you sure you want to logout from your account?",
              );

              if (confirm == true) {
                onPressed();
              }
            },
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
                "Logout",
                style: AppStyle.font18WhiteBold,
                textAlign: TextAlign.center,
              ),
            ),
    );
  }
}
