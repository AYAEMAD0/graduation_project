import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../../../core/theme/app_style.dart';
import 'build_profile_avatar.dart';
import 'build_profile_stat.dart';

class BuildProfileCard extends StatelessWidget {
  final bool isLoading;
  final String? displayName;
  final ImageProvider? currentImage;
  final VoidCallback onEditImageTap;

  const BuildProfileCard({
    super.key,
    required this.isLoading,
    required this.displayName,
    required this.currentImage,
    required this.onEditImageTap,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color.fromRGBO(168, 6, 249, 0.1), Color.fromRGBO(168, 6, 249, 0.0)],
        ),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: .05), blurRadius: 0)],
      ),
      child: Column(
        children: [
          BuildProfileAvatar(
            currentImage: currentImage,
            onEditTap: onEditImageTap,
          ),
          const SizedBox(height: 20),
          isLoading
              ? SizedBox(
            width: 150,
            height: 15,
            child: LinearProgressIndicator(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xFFA806F9),
              backgroundColor: Color(0xFFA806F9).withValues(alpha: 0.2),
            ),
          )
              : Text(
            displayName ?? "No Name",
            style: AppStyle.font24BlackBold.copyWith(fontSize: isMobile ? 24 : 60),
          ),
          const SizedBox(height: 8),
          Text(
            "Frontend Engineer",
            style: AppStyle.font24BlackBold.copyWith(
              fontSize: isMobile ? 20 : 24,
              color: Color(0xFFA806F9),
            ),
          ),
          const SizedBox(height: 14),
          Divider(thickness: 1.5, color: Colors.black.withValues(alpha: .35)),
          const SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              BuildProfileStat(value: "1", label: "INTERVIEWS"),
              BuildProfileStat(value: "85%", label: "AVG SCORE"),
            ],
          ),
        ],
      ),
    );
  }
}