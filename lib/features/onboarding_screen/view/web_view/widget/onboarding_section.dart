import 'package:flutter/material.dart';

import '../../../../../core/theme/app_style.dart';

class OnboardingSection extends StatelessWidget {
  final String title;
  final String image;
  final String description;

  const OnboardingSection({
    super.key,
    required this.title,
    required this.image,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      children: [
        Text(
          title,
          style: AppStyle.font40BlackSemiBold.copyWith(
            color: isDark ? Colors.white : Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 30),
        Image.asset(image, height: 350, fit: BoxFit.contain),
        SizedBox(height: 30),
        Text(
          description,
          style: AppStyle.font27BlackLight.copyWith(
            color: isDark ? Colors.grey.shade300 : Colors.black87,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
