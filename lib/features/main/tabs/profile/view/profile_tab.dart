import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mock_mate_ai/core/helper/picker_helper.dart';
import 'package:mock_mate_ai/core/helper/shared_check_helper.dart';

import '../../../../../core/config/di.dart';
import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/widget/custom_toast.dart';
import '../viewmodel/logout/logout_cubit.dart';
import '../viewmodel/logout/logout_state.dart';
import '../viewmodel/profile/profile_cubit.dart';
import '../viewmodel/profile/profile_state.dart';
import 'profile_tab_view.dart';

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

  String _lastFullName = '';
  String _lastPhone = '';

  @override
  void initState() {
    super.initState();
    cubitProfile = context.read<ProfileCubit>();
    cubitLogout = getIt<LogoutCubit>();
    fullNameController.addListener(_onTextChanged);
    phoneController.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    final nameChanged = fullNameController.text != _lastFullName;
    final phoneChanged = phoneController.text != _lastPhone;

    if (nameChanged || phoneChanged) {
      _lastFullName = fullNameController.text;
      _lastPhone = phoneController.text;
      cubitProfile.checkChanges(
        displayName: fullNameController.text,
        phoneNumber: phoneController.text,
      );
    }
  }

  @override
  void dispose() {
    fullNameController.removeListener(_onTextChanged);
    phoneController.removeListener(_onTextChanged);
    fullNameController.dispose();
    phoneController.dispose();
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
              if (state is ProfileSuccess || state is ProfileUpdateSuccess) {
                final user = (state as dynamic).user;
                fullNameController.text = user.displayName ?? '';
                phoneController.text = user.phoneNumber ?? '';
                _lastFullName = user.displayName ?? '';
                _lastPhone = user.phoneNumber ?? '';
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
        child: ProfileTabView(
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
        ),
      ),
    );
  }
}