import 'package:flutter/material.dart';

import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/app_style.dart';

class BuildBtnUploadCv extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onAnalyzePressed;

  const BuildBtnUploadCv({
    super.key,
    required this.isLoading,
    required this.onAnalyzePressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.purple,
          disabledBackgroundColor: AppColor.purple.withValues(alpha: 0.6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 0,
        ),
        onPressed: isLoading ? null : onAnalyzePressed,
        child: isLoading
            ? const SizedBox(
          height: 24,
          width: 24,
          child: CircularProgressIndicator(
            color: Colors.white,
            strokeWidth: 2,
          ),
        )
            : Text(
          "Analyze and Generate Questions",
          style: AppStyle.font18WhiteBold,
        ),
      ),
    );
  }
}