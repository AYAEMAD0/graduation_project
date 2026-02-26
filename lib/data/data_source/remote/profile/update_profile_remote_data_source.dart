import 'dart:typed_data';

import 'package:mock_mate_ai/api/model/user/user_model_dto.dart';

abstract class UpdateProfileRemoteDataSource {
  Future<UserModelDto> updateProfile({
    required String displayName,
    required String phoneNumber,
    String? imagePath,
    Uint8List? imageBytes,
  });
}