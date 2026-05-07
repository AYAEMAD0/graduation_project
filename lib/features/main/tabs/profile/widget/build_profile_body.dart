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
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 800),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 40),
          child: Column(
            children: [
              SizedBox(height: isMobile ? 20 : 30),
              BuildProfileCard(
                isLoading: isLoadingEdit,
                displayName: user?.displayName ?? "No Name",
                phone: user?.phoneNumber ?? "No Phone",
                currentImage: currentImage,
                onEditImageTap: onEditImageTap,
              ),
              const SizedBox(height: 30),
              BuildProfilePersonalInfo(
                fullNameController: fullNameController,
                phoneController: phoneController,
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BuildProfileEditButton(
                    isLoading: isLoadingEdit,
                    onPressed: onUpdatePressed,
                  ),
                  SizedBox(width: isMobile ? 20 : 20),
                  BuildProfileLogoutButton(
                    isLoading: isLoadingLogout,
                    onPressed: onLogoutPressed,
                  ),
                ],
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
