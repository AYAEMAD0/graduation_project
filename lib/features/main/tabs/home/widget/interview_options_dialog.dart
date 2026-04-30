import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/routes/app_routes.dart';
import 'package:mock_mate_ai/core/theme/app_color.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';

class InterviewOptionsDialog extends StatefulWidget {
  const InterviewOptionsDialog({super.key});

  @override
  State<InterviewOptionsDialog> createState() => _InterviewOptionsDialogState();
}

class _InterviewOptionsDialogState extends State<InterviewOptionsDialog> {
  String? selectedMode;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Container(
        padding: const EdgeInsets.all(32),
        width: 600,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Choose Your Path",
              style: AppStyle.font18WhiteBold.copyWith(
                color: AppColor.grayDarkColor,
                fontSize: 28,
              ),
            ),
            const SizedBox(height: 40),
            Row(
              children: [
                Expanded(
                  child: _buildOptionCard(
                    title: "Standard Mode",
                    desc: "Questions from database",
                    icon: Icons.storage_rounded,
                    mode: 'db',
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: _buildOptionCard(
                    title: "AI Power",
                    desc: "Tailored to your CV",
                    icon: Icons.auto_awesome,
                    mode: 'ai',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.purple,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: selectedMode == null
                  ? null
                  : () {
                      Navigator.pop(context);
                      Navigator.pushNamed(
                        context,
                        AppRoutes.uploadCvJd,
                        arguments: selectedMode,
                      );
                    },
              child: const Text(
                "Confirm Selection",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionCard({
    required String title,
    required String desc,
    required IconData icon,
    required String mode,
  }) {
    bool isSelected = selectedMode == mode;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedMode = mode;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
        decoration: BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? AppColor.purple : AppColor.slate200,
            width: isSelected ? 2.5 : 1,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppColor.purple.withOpacity(0.15),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ]
              : [],
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColor.purple.withOpacity(0.1)
                    : AppColor.whiteDarkColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 35,
                color: isSelected ? AppColor.purple : AppColor.slateGray,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              title,
              style: AppStyle.font18WhiteBold.copyWith(
                color: isSelected ? AppColor.purple : AppColor.grayDarkColor,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              desc,
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColor.slateGray, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
