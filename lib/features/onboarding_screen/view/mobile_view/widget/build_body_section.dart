import 'package:flutter/material.dart';

import '../../../../../core/theme/app_style.dart';
import '../../../../../domain/entities/onboarding/onboarding_entity.dart';

class BuildBodySection extends StatelessWidget {
  const BuildBodySection({super.key, required this.page});

  final OnboardingEntity page;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            page.title,
            style: AppStyle.font34BlackSemiBold,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 6),
          Image.asset(page.image, height: 240, fit: BoxFit.cover),
          SizedBox(height: 10),
          Text(
            page.description,
            style: AppStyle.font25BlackLight,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
