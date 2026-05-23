import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';

import '../theme/app_color.dart';

class CustomDialog {
  static void showLoading({required BuildContext context}) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Row(
            spacing: 20,
            children: [
              CircularProgressIndicator(color: AppColor.primaryBlueColor),
              Text(
                'Loading',
                style: AppStyle.font20BlackSemiBold.copyWith(
                  color: isDark ? Colors.white : null,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static void hideLoading({required BuildContext context}) {
    Navigator.pop(context);
  }

  static void showMessage({
    required BuildContext context,
    required String message,
    required String title,
    TextStyle? styleTitle,
    String? posActionName,
    Function? posActionClick,
    String? nagActionName,
    Function? nagActionClick,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    List<Widget>? actions = [];
    if (posActionName != null) {
      actions.add(
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            posActionClick?.call();
          },
          child: Text(posActionName, style: AppStyle.font20BlueDarkBold),
        ),
      );
    }
    if (nagActionName != null) {
      actions.add(
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            nagActionClick?.call();
          },
          child: Text(nagActionName, style: AppStyle.font20BlueDarkBold),
        ),
      );
    }

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text(
            title,
            style: AppStyle.font20BlackBold.copyWith(
              color: isDark ? Colors.white : null,
            ),
          ),
          content: Text(
            message,
            style: AppStyle.font16BlackRegular.copyWith(
              color: isDark ? Colors.white70 : null,
            ),
          ),
          actions: actions,
        );
      },
    );
  }

  static Future<bool?> showConfirm({
    required BuildContext context,
    required String title,
    required String message,
    String confirmText = "Yes",
    String cancelText = "No",
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: isDark
            ? Theme.of(context).cardColor
            : AppColor.whiteColor,
        title: Text(
          title,
          style: AppStyle.font20BlackBold.copyWith(
            color: isDark ? Colors.white : null,
          ),
        ),
        content: Text(
          message,
          style: AppStyle.font16BlackRegular.copyWith(
            color: isDark ? Colors.white70 : null,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(cancelText, style: AppStyle.font20BlueDarkBold),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(confirmText, style: AppStyle.font20BlueDarkBold),
          ),
        ],
      ),
    );
  }

  static void showGenerating({required BuildContext context}) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: isDark ? Theme.of(context).cardColor : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 80,
                  height: 80,
                  child: CircularProgressIndicator(
                    strokeWidth: 6,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      AppColor.primaryPurpleColor,
                    ),
                  ),
                ),
                const SizedBox(height: 28),
                Text(
                  "Generating Your Interview",
                  style: AppStyle.font20BlackSemiBold.copyWith(
                    color: isDark ? Colors.white : null,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Text(
                  "Please wait while we prepare your questions...",
                  style: AppStyle.font16BlackRegular.copyWith(
                    color: isDark ? Colors.grey.shade400 : Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static void showTimeExpired({
    required BuildContext context,
    required VoidCallback onSubmit,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Row(
            spacing: 12,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.timer_off, color: Colors.red),
              Text(
                "Time's Up!",
                style: AppStyle.font20BlackBold.copyWith(
                  color: isDark ? Colors.white : null,
                ),
              ),
            ],
          ),
          content: Text(
            "Your time has expired.\nYou will be redirected to the submit page.",
            style: AppStyle.font16BlackRegular.copyWith(
              color: isDark ? Colors.white70 : null,
            ),
            textAlign: TextAlign.center,
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                onSubmit();
              },
              child: Text("Submit Now", style: AppStyle.font20BlueDarkBold),
            ),
          ],
        );
      },
    );
  }
}
