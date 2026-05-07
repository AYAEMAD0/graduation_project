import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../../core/theme/app_style.dart';
import 'build_loading_line.dart';
import 'build_profile_avatar.dart';

class BuildProfileCard extends StatelessWidget {
  final bool isLoading;
  final String? displayName;
  final String? phone;
  final ImageProvider? currentImage;
  final VoidCallback onEditImageTap;

  const BuildProfileCard({
    super.key,
    required this.isLoading,
    required this.displayName,
    required this.phone,
    required this.currentImage,
    required this.onEditImageTap,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(168, 6, 249, 0.1),
            Color.fromRGBO(168, 6, 249, 0.0),
          ],
        ),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: .05), blurRadius: 0),
        ],
      ),
      child: Row(
        children: [
          BuildProfileAvatar(
            currentImage: currentImage,
            onEditTap: onEditImageTap,
          ),
          const SizedBox(width: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isLoading
                  ? const LoadingLine()
                  : Text(
                      displayName ?? "No Name",
                      style: AppStyle.font24BlackBold.copyWith(
                        fontSize: isMobile ? 24 : 30,
                      ),
                    ),

              const SizedBox(height: 8),

              isLoading
                  ? const LoadingLine()
                  : Text(
                      phone ?? "No phone",
                      style: AppStyle.font15GrayDarkRegular.copyWith(
                        fontSize: isMobile ? 14 : 16,
                      ),
                    ),
              const SizedBox(height: 8),
            ],
          ),
        ],
      ),
    );
  }
}
