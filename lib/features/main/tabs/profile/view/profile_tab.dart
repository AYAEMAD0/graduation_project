import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mock_mate_ai/core/helper/picker_helper.dart';
import 'package:mock_mate_ai/core/helper/shared_check_helper.dart';

import '../../../../../core/config/di.dart';
import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/theme/app_color.dart';
import '../../../../../core/widget/custom_toast.dart';
import '../viewmodel/logout/logout_cubit.dart';
import '../viewmodel/logout/logout_state.dart';
import '../viewmodel/profile/profile_cubit.dart';
import '../viewmodel/profile/profile_state.dart';
import '../widget/build_profile_background_effect.dart';
import '../widget/build_profile_body.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  final fullNameController = TextEditingController();
  final phoneController = TextEditingController();
  late ProfileCubit cubitProfile;
  late LogoutCubit cubitLogout;

  @override
  void initState() {
    super.initState();
    cubitProfile = context.read<ProfileCubit>();
    cubitLogout = getIt<LogoutCubit>();
    final userId = SharedCheckHelper.getValue(SharedCheckHelper.keyUserId);
    if (userId != null) cubitProfile.getProfile(userId);
  }

  @override
  void dispose() {
    fullNameController.dispose();
    phoneController.dispose();
    cubitLogout.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: cubitProfile),
        BlocProvider.value(value: cubitLogout),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<ProfileCubit, ProfileState>(
            listener: (context, state) {
              if (state is ProfileUpdateSuccess) {
                fullNameController.clear();
                phoneController.clear();
                cubitProfile.clearImage();
              }
              if (state is ProfileError) {
                CustomToast.showToast(message: state.error, context: context);
              }
            },
          ),
          BlocListener<LogoutCubit, LogoutState>(
            listener: (context, state) {
              if (state is LogoutSuccess) {
                SharedCheckHelper.clearAll();
                CustomToast.showToast(message: state.message, context: context);
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.login,
                  (route) => false,
                );
              }
              if (state is LogoutError) {
                CustomToast.showToast(message: state.error, context: context);
              }
            },
          ),
        ],
        child: BlocBuilder<ProfileCubit, ProfileState>(
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
              _
                  when (user?.avatarPath != null &&
                      user!.avatarPath!.isNotEmpty) =>
                NetworkImage(user.avatarPath!),
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
                        isLoadingEdit: isLoading,
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
                            cubitProfile.selectImage(
                              imagePath: file.path,
                              imageBytes: file.bytes,
                            );
                          }
                        },
                        onUpdatePressed: () => cubitProfile.updateProfile(
                          displayName: fullNameController.text,
                          phoneNumber: phoneController.text,
                        ),
                        onLogoutPressed: () => cubitLogout.logout(),
                        isLoadingLogout:
                            context.watch<LogoutCubit>().state is LogoutLoading,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
