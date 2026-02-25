import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../domain/entities/user/user_entity.dart';
import '../../features/main/tabs/profile/widget/build_profile_card.dart';
import '../../features/main/tabs/profile/widget/build_profile_edit_button.dart';
import '../../features/main/tabs/profile/widget/build_profile_personal_info.dart';
import 'custom_button.dart';

class BuildProfileBody extends StatelessWidget {
  final bool isLoading;
  final UserEntity? user;
  final ImageProvider? currentImage;
  final TextEditingController fullNameController;
  final TextEditingController phoneController;
  final VoidCallback onEditImageTap;
  final VoidCallback onUpdatePressed;
  final VoidCallback onLogoutPressed;

  const BuildProfileBody({
    super.key,
    required this.isLoading,
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
        constraints: const BoxConstraints(maxWidth: 1200),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 40),
          child: Column(
            children: [
              SizedBox(height: isMobile ? 20 : 70),
              BuildProfileCard(
                isLoading: isLoading,
                displayName: user?.displayName ?? "No Name",
                currentImage: currentImage,
                onEditImageTap: onEditImageTap,
              ),
              const SizedBox(height: 30),
              BuildProfilePersonalInfo(
                fullNameController: fullNameController,
                phoneController: phoneController,
              ),
              const SizedBox(height: 30),
              BuildProfileEditButton(
                isLoading: isLoading,
                onPressed: onUpdatePressed,
              ),
              const SizedBox(height: 30),
              CustomButton(
                widthBtn: isMobile ? 250 : 600,
                onPressed: onLogoutPressed,
                text: "Logout",
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}