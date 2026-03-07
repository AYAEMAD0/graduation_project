import 'package:flutter/material.dart';

import '../../../../../core/widget/custom_button.dart';
import '../../../../core/theme/app_style.dart';

class McqSaveButton extends StatelessWidget {
  final bool isSaving;
  final bool isSaved;
  final VoidCallback onPressed;

  const McqSaveButton({
    super.key,
    required this.isSaving,
    required this.isSaved,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomButton(
        widthBtn: 300,
        onPressed: isSaving
            ? null
            : isSaved
            ? () {}
            : onPressed,

        child: isSaving
            ? Center(
                child: const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2.5,
                  ),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (isSaved)
                    Icon(
                      Icons.check_circle,
                      color: Colors.white,
                      size: 20,
                    ),
                  const SizedBox(width: 8),
                  Text(
                    isSaved ? "Saved!" : "Save Option",
                    style: AppStyle.font18WhiteBold,
                  ),
                ],
              ),
      ),
    );
  }
}
