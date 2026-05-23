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
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      backgroundColor: isDark ? Theme.of(context).cardColor : AppColor.whiteColor,
      child: Container(
        padding: const EdgeInsets.all(32),
        width: 600,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Choose Your Type Interview",
              style: AppStyle.font18WhiteBold.copyWith(
                color: isDark ? Colors.white : AppColor.grayDarkColor,
                fontSize: 28,
              ),
            ),
            const SizedBox(height: 40),
            Row(
              children: [
                Expanded(
                  child: _buildOptionCard(
                    isDark: isDark,
                    title: "Standard",
                    desc: "Curated industry questions",
                    icon: Icons.library_books_rounded,
                    mode: 'db',
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _buildOptionCard(
                    isDark: isDark,
                    title: "AI Power",
                    desc: "Tailored to your experience",
                    icon: Icons.auto_awesome,
                    mode: 'ai',
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _buildOptionCard(
                    isDark: isDark,
                    title: "Live Interview",
                    desc: "Real-time conversational AI",
                    icon: Icons.video_camera_front_rounded,
                    mode: 'voice',
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
                disabledBackgroundColor: isDark ? Colors.white10 : null,
              ),
              onPressed: selectedMode == null
                  ? null
                  : () {
                Navigator.pop(context);
                if (selectedMode == 'voice') {
                  Navigator.pushNamed(context, AppRoutes.voicePreInterview);
                } else {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.uploadCvJd,
                    arguments: selectedMode,
                  );
                }
              },
              child: Text(
                "Confirm Selection",
                style: TextStyle(
                  color: selectedMode == null && isDark ? Colors.white30 : Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionCard({
    required bool isDark,
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
          color: isSelected
              ? (isDark ? const Color(0xff2A1B4E) : AppColor.whiteColor)
              : (isDark ? const Color(0xff1E1E24) : AppColor.whiteColor),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected
                ? AppColor.purple
                : (isDark ? Colors.white.withValues(alpha: 0.08) : AppColor.slate200),
            width: isSelected ? 2.5 : 1,
          ),
          boxShadow: isSelected
              ? [
            BoxShadow(
              color: AppColor.purple.withValues(alpha: isDark ? 0.3 : 0.15),
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
                    ? AppColor.purple.withValues(alpha: 0.1)
                    : (isDark ? Colors.white.withValues(alpha: 0.05) : AppColor.whiteDarkColor),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 35,
                color: isSelected ? AppColor.purple : (isDark ? Colors.grey.shade400 : AppColor.slateGray),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              title,
              style: AppStyle.font18WhiteBold.copyWith(
                color: isSelected
                    ? AppColor.purple
                    : (isDark ? Colors.white : AppColor.grayDarkColor),
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              desc,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: isDark ? Colors.grey.shade400 : AppColor.slateGray,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}