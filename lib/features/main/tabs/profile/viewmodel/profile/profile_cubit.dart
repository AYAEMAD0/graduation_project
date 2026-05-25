import 'dart:typed_data';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/exception/exception_handler.dart';
import '../../../../../../core/helper/shared_check_helper.dart';
import '../../../../../../domain/entities/user/user_entity.dart';
import '../../../../../../domain/usecase/profile/get_profile_usecase.dart';
import '../../../../../../domain/usecase/profile/update_profile_usecase.dart';
import 'profile_state.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  final GetProfileUseCase getProfileUseCase;
  final UpdateProfileUseCase updateProfileUseCase;

  String? _imagePath;
  Uint8List? _imageBytes;
  UserEntity? _currentUser;

  String? _originalName;
  String? _originalPhone;

  ProfileCubit(this.getProfileUseCase, this.updateProfileUseCase)
      : super(const ProfileInitial());

  bool hasChanges({
    required String displayName,
    required String phoneNumber,
  }) {
    final nameChanged = displayName.trim() != (_originalName ?? '');
    final phoneChanged = phoneNumber.trim() != (_originalPhone ?? '');
    final imageChanged = _imagePath != null || _imageBytes != null;

    return nameChanged || phoneChanged || imageChanged;
  }

  Future<void> getProfile(int id) async {
    emit(const ProfileLoading());
    try {
      final user = await getProfileUseCase(id);
      _currentUser = user;
      _originalName = user.displayName;
      _originalPhone = user.phoneNumber;
      emit(ProfileSuccess(user));
    } catch (e) {
      emit(ProfileError(e.toString(), lastUser: _currentUser));
    }
  }

  void selectImage({String? imagePath, Uint8List? imageBytes}) {
    _imagePath = imagePath;
    _imageBytes = imageBytes;
    emit(ProfileImageSelected(
      imagePath: imagePath,
      imageBytes: imageBytes,
      user: _currentUser,
    ));
  }


  void checkChanges({
    required String displayName,
    required String phoneNumber,
  }) {
    final nameNotEmpty = displayName
        .trim()
        .isNotEmpty;
    final phoneNotEmpty = phoneNumber
        .trim()
        .isNotEmpty;

    if (!nameNotEmpty || !phoneNotEmpty) {
      final currentState = state;
      if (currentState is ProfileSuccess) {
        emit(ProfileSuccess(currentState.user, hasChanges: false));
      } else if (currentState is ProfileImageSelected) {
        emit(ProfileImageSelected(
          imagePath: _imagePath,
          imageBytes: _imageBytes,
          user: _currentUser,
          hasChanges: false,
        ));
      }
      return;
    }

    final nameChanged = displayName.trim() != (_originalName?.trim() ?? '');
    final phoneChanged = phoneNumber.trim() != (_originalPhone?.trim() ?? '');
    final imageChanged = _imagePath != null || _imageBytes != null;

    final changed = nameChanged || phoneChanged || imageChanged;

    final currentState = state;
    if (currentState is ProfileSuccess) {
      emit(ProfileSuccess(currentState.user, hasChanges: changed));
    } else if (currentState is ProfileImageSelected) {
      emit(ProfileImageSelected(
        imagePath: _imagePath,
        imageBytes: _imageBytes,
        user: _currentUser,
        hasChanges: changed,
      ));
    }
  }
  void clearImage() {
    _imagePath = null;
    _imageBytes = null;
    emit(ProfileImageSelected(
      imagePath: null,
      imageBytes: null,
      user: _currentUser,
      hasChanges: false,
    ));
  }

  Future<void> updateProfile({
    required String displayName,
    required String phoneNumber,
  }) async {
    emit(const ProfileLoading());
    try {
      final finalName = displayName
          .trim()
          .isNotEmpty
          ? displayName.trim()
          : _currentUser?.displayName ?? '';

      final finalPhone = phoneNumber
          .trim()
          .isNotEmpty
          ? phoneNumber.trim()
          : _currentUser?.phoneNumber ?? '';

      final user = await updateProfileUseCase(
        displayName: finalName,
        phoneNumber: finalPhone,
        imagePath: _imagePath,
        imageBytes: _imageBytes,
      );
      _currentUser = user;
      await SharedCheckHelper.setValue(
          SharedCheckHelper.keyDisplayName, finalName);
      emit(ProfileUpdateSuccess(user));
    } catch (e) {
      emit(
          ProfileError(ExceptionHandler.getMessage(e), lastUser: _currentUser));
    }
  }
}