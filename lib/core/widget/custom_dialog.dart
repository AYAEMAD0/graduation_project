import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';
import '../theme/app_color.dart';
import '../theme/app_theme.dart';

class CustomDialog {
  static void showLoading({
    required BuildContext context,
  }) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppTheme.theme.scaffoldBackgroundColor,
          title: Row(
            spacing: 20,
            children: [
              CircularProgressIndicator(color: AppColor.primaryBlueColor),
              Text('Loading', style:AppStyle.font20BlackSemiBold,),
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
          child: Text(nagActionName, style:  AppStyle.font20BlueDarkBold),
        ),
      );
    }

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor:  AppTheme.theme.scaffoldBackgroundColor,
          title: Text(title, style: AppStyle.font20BlackBold),
          content: Text(message, style: AppStyle.font16BlackRegular,),
          actions: actions,
        );
      },
    );
  }
}
