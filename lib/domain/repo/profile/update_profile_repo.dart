import 'dart:typed_data';

import 'package:mock_mate_ai/domain/entities/user/user_entity.dart';

abstract class UpdateProfileRepo {
  Future<UserEntity> updateProfile({
    required String displayName,
    required String phoneNumber,
    String? imagePath,
    Uint8List? imageBytes,
  });
}