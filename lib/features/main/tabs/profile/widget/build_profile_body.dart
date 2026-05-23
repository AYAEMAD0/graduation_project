import 'package:flutter/material.dart';
import 'package:mock_mate_ai/features/main/tabs/profile/widget/build_profile_logout_button.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../../domain/entities/user/user_entity.dart';
import 'build_profile_card.dart';
import 'build_profile_edit_button.dart';
import 'build_profile_personal_info.dart';

class BuildProfileBody extends StatelessWidget {
  final bool isLoadingEdit;
  final bool isLoadingLogout;
  final UserEntity? user;
  final ImageProvider? currentImage;
  final TextEditingController fullNameController;
  final TextEditingController phoneController;
  final VoidCallback onEditImageTap;
  final VoidCallback onUpdatePressed;
  final VoidCallback onLogoutPressed;
  final bool hasChanges;

  const BuildProfileBody({
    super.key,
    required this.isLoadingEdit,
    required this.isLoadingLogout,
    required this.user,
    required this.currentImage,
    required this.fullNameController,
    required this.phoneController,
    required this.onEditImageTap,
    required this.onUpdatePressed,
    required this.onLogoutPressed,
    required this.hasChanges,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 32,
        vertical: isMobile ? 20 : 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BuildProfileCard(
            isLoading: isLoadingEdit,
            displayName: user?.displayName ?? "No Name",
            phone: user?.phoneNumber ?? "No Phone",
            currentImage: currentImage,
            onEditImageTap: onEditImageTap,
          ),

          const SizedBox(height: 32),

          BuildProfilePersonalInfo(
            fullNameController: fullNameController,
            phoneController: phoneController,
          ),

          const SizedBox(height: 32),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: BuildProfileEditButton(
                  isLoading: isLoadingEdit,
                  isEnabled: hasChanges,
                  onPressed: onUpdatePressed,
                ),
              ),

              SizedBox(width: isMobile ? 16 : 24),

              Expanded(
                child: BuildProfileLogoutButton(
                  isLoading: isLoadingLogout,
                  onPressed: onLogoutPressed,
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
