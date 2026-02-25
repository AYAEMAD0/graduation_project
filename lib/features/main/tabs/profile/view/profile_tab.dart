import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mock_mate_ai/core/helper/picker_helper.dart';
import 'package:mock_mate_ai/core/helper/shared_check_helper.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../../../core/config/di.dart';
import '../../../../../core/theme/app_color.dart';
import '../../../../../core/widget/build_profile_body.dart';
import '../../../../../core/widget/custom_toast.dart';
import '../viewmodel/profile/profile_cubit.dart';
import '../viewmodel/profile/profile_state.dart';
import '../widget/build_profile_background_effect.dart';


class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  final fullNameController = TextEditingController();
  final phoneController = TextEditingController();
  late ProfileCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = getIt<ProfileCubit>();
    final userId = SharedCheckHelper.getValue(SharedCheckHelper.keyUserId);
    if (userId != null) cubit.getProfile(userId);
  }

  @override
  void dispose() {
    fullNameController.dispose();
    phoneController.dispose();
    cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    return BlocProvider.value(
      value: cubit,
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is ProfileUpdateSuccess) {
            fullNameController.clear();
            phoneController.clear();
            cubit.clearImage();
          }
          if (state is ProfileError) {
            CustomToast.showToast(message: state.error, context: context);
          }
        },
        builder: (context, state) {
          final isLoading = state is ProfileLoading;

          final user = switch (state) {
            ProfileSuccess s => s.user,
            ProfileUpdateSuccess s => s.user,
            ProfileImageSelected s => s.user,
            ProfileError s => s.lastUser,
            _ => null,
          };

          final ImageProvider? currentImage = switch (state) {
            ProfileImageSelected s when s.imageBytes != null => MemoryImage(
              s.imageBytes!,
            ),
            ProfileImageSelected s when s.imagePath != null => FileImage(
              File(s.imagePath!),
            ),
            _ when user?.avatarPath != null => NetworkImage(user!.avatarPath!),
            _ => null,
          };
          return Scaffold(
            backgroundColor: AppColor.homeBackground,
            body: SafeArea(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    ...BuildProfileBackgroundEffect.items(context),
                    BuildProfileBody(
                      isLoading: isLoading,
                      user: user,
                      currentImage: currentImage,
                      fullNameController: fullNameController,
                      phoneController: phoneController,
                      onEditImageTap: () async {
                        final file = await PickerHelper.pickFile(context, [
                          'jpg',
                          'jpeg',
                          'png',
                        ]);
                        if (file != null) {
                          cubit.selectImage(
                            imagePath: file.path,
                            imageBytes: file.bytes,
                          );
                        }
                      },
                      onUpdatePressed: () => cubit.updateProfile(
                        displayName: fullNameController.text,
                        phoneNumber: phoneController.text,
                      ),
                      onLogoutPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
