import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/theme/app_color.dart';
import '../viewmodel/logout/logout_cubit.dart';
import '../viewmodel/logout/logout_state.dart';
import '../viewmodel/profile/profile_cubit.dart';
import '../viewmodel/profile/profile_state.dart';
import '../widget/build_profile_background_effect.dart';
import '../widget/build_profile_body.dart';

class ProfileTabView extends StatelessWidget {
  final TextEditingController fullNameController;
  final TextEditingController phoneController;
  final Future<void> Function() onEditImageTap;
  final VoidCallback onUpdatePressed;
  final VoidCallback onLogoutPressed;

  const ProfileTabView({
    super.key,
    required this.fullNameController,
    required this.phoneController,
    required this.onEditImageTap,
    required this.onUpdatePressed,
    required this.onLogoutPressed,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    final Color backgroundColor = isDark
        ? const Color(0xff0A0D14)
        : Colors.white;

    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        final isLoading = state is ProfileLoading;

        final user = switch (state) {
          ProfileSuccess s => s.user,
          ProfileUpdateSuccess s => s.user,
          ProfileImageSelected s => s.user,
          ProfileError s => s.lastUser,
          _ => null,
        };

        final hasChanges = switch (state) {
          ProfileSuccess s => s.hasChanges,
          ProfileImageSelected s => s.hasChanges,
          _ => false,
        };

        final ImageProvider? currentImage = switch (state) {
          ProfileImageSelected s when s.imageBytes != null => MemoryImage(
            s.imageBytes!,
          ),
          ProfileImageSelected s when s.imagePath != null => FileImage(
            File(s.imagePath!),
          ),
          _ when (user?.avatarPath != null && user!.avatarPath!.isNotEmpty) =>
              NetworkImage(user.avatarPath!),
          _ => null,
        };

        return Scaffold(
          backgroundColor: backgroundColor,
          body: SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  ...BuildProfileBackgroundEffect.items(context),
                  BuildProfileBody(
                    isLoadingEdit: isLoading,
                    hasChanges: hasChanges,
                    user: user,
                    currentImage: currentImage,
                    fullNameController: fullNameController,
                    phoneController: phoneController,
                    onEditImageTap: onEditImageTap,
                    onUpdatePressed: onUpdatePressed,
                    onLogoutPressed: onLogoutPressed,
                    isLoadingLogout:
                    context.watch<LogoutCubit>().state is LogoutLoading,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}