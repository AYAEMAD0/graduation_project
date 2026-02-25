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

class ProfileSuccess extends ProfileState {
  final UserEntity user;
  const ProfileSuccess(this.user);
}

class ProfileUpdateSuccess extends ProfileState {
  final UserEntity user;
  const ProfileUpdateSuccess(this.user);
}

class ProfileError extends ProfileState {
  final String error;
  final UserEntity? lastUser;
  const ProfileError(this.error, {this.lastUser});
}

class ProfileImageSelected extends ProfileState {
  final String? imagePath;
  final Uint8List? imageBytes;
  final UserEntity? user;
  const ProfileImageSelected({this.imagePath, this.imageBytes, this.user});
}