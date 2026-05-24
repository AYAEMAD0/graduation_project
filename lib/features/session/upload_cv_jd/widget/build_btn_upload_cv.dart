import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/widget/custom_button.dart';

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
      height: 45,
      child: CustomButton(
        onPressed: isLoading ? null : onAnalyzePressed,
        borderRadius: 14,
        child: isLoading
            ? Center(
                child: const SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Analyze and Generate Questions",
                  textAlign: TextAlign.center,
                  style: AppStyle.font18WhiteBold,
                ),
              ),
      ),
    );
  }
}
