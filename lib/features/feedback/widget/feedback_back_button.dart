import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/widget/arrow_button.dart';

class FeedbackBackButton extends StatelessWidget {
  const FeedbackBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ArrowButton(
          onTap: () {
            Navigator.pushNamedAndRemoveUntil(
              context,

              AppRoutes.home,

              (route) => false,
            );
          },
        ),

        const SizedBox(width: 14),

        Text("Back To Home", style: AppStyle.font18BlackMedium,),
      ],
    );
  }
}
