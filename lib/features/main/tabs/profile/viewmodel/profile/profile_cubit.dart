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


  ProfileCubit(this.getProfileUseCase, this.updateProfileUseCase)
      : super(const ProfileInitial());

  Future<void> getProfile(int id) async {
    emit(const ProfileLoading());
    try {
      final user = await getProfileUseCase(id);
      _currentUser = user;
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

  void clearImage() {
    _imagePath = null;
    _imageBytes = null;
    emit(ProfileImageSelected(
      imagePath: null,
      imageBytes: null,
      user: _currentUser,
    ));
  }

  Future<void> updateProfile({
    required String displayName,
    required String phoneNumber,
  }) async {
    emit(const ProfileLoading());
    try {
      final user = await updateProfileUseCase(
        displayName: displayName,
        phoneNumber: phoneNumber,
        imagePath: _imagePath,
        imageBytes: _imageBytes,
      );
      _currentUser = user;
      await SharedCheckHelper.setValue(SharedCheckHelper.keyDisplayName,displayName);
      emit(ProfileUpdateSuccess(user));
    } catch (e) {
      emit(ProfileError(
        ExceptionHandler.getMessage(e),
        lastUser: _currentUser,
      ));
    }
  }
}