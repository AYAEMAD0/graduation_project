import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../../../../../../domain/entities/user/user_entity.dart';

@immutable
abstract class ProfileState {
  const ProfileState();
}

class ProfileInitial extends ProfileState {
  const ProfileInitial();
}

class ProfileLoading extends ProfileState {
  const ProfileLoading();
}


class ProfileUpdateSuccess extends ProfileState {
  final UserEntity user;
  final bool hasChanges;

  const ProfileUpdateSuccess(this.user, {this.hasChanges = false});
}

class ProfileError extends ProfileState {
  final String error;
  final UserEntity? lastUser;
  const ProfileError(this.error, {this.lastUser});
}

class ProfileSuccess extends ProfileState {
  final UserEntity user;
  final bool hasChanges;

  const ProfileSuccess(this.user, {this.hasChanges = false});
}

class ProfileImageSelected extends ProfileState {
  final String? imagePath;
  final Uint8List? imageBytes;
  final UserEntity? user;
  final bool hasChanges;

  const ProfileImageSelected({
    this.imagePath,
    this.imageBytes,
    this.user,
    this.hasChanges = false,
  });
}