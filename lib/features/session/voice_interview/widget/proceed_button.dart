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
        height: 60,
        child: CustomButton(
          onPressed: isEnabled ? onPressed : null,
          child: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Text(
              'Proceed to Interview',
              textAlign: TextAlign.center,
              style: AppStyle.font25WhiteBold.copyWith(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
