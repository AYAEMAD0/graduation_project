import 'package:flutter/material.dart';

import '../../../../core/theme/app_style.dart';
import '../../../../core/widget/custom_button.dart';

class ProceedButton extends StatelessWidget {
  final bool isEnabled;
  final VoidCallback? onPressed;

  const ProceedButton({
    required this.isEnabled,
    required this.onPressed,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 400,
        height: 40,
        child: Opacity(
          opacity: isEnabled ? 1.0 : 0.4,
          child: CustomButton(
            onPressed: isEnabled ? onPressed : null,
            borderRadius: 16,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                'Proceed to Interview',
                textAlign: TextAlign.center,
                style: AppStyle.font25WhiteBold.copyWith(
                    fontSize: 18, fontWeight: FontWeight.w300),
              ),
            ),
          ),
        ),
      ),
    );
  }
}