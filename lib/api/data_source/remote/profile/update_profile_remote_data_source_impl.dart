import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:mock_mate_ai/api/api_endpoint.dart';
import 'package:mock_mate_ai/api/model/user/user_model_dto.dart';
import '../../../../data/data_source/remote/profile/update_profile_remote_data_source.dart';
import '../../../api_services.dart';

@Injectable(as: UpdateProfileRemoteDataSource)
class UpdateProfileRemoteDataSourceImpl implements UpdateProfileRemoteDataSource {
  final ApiServices apiServices;

  UpdateProfileRemoteDataSourceImpl(this.apiServices);

  @override
  Future<UserModelDto> updateProfile({
    required String displayName,
    required String phoneNumber,
    String? imagePath,
    Uint8List? imageBytes,
    String? imageFileName,
  }) async {
    final formData = FormData.fromMap({
      "displayName": displayName,
      "phoneNumber": phoneNumber,
      if (imagePath != null || imageBytes != null)
        "image": kIsWeb
            ? MultipartFile.fromBytes(
          imageBytes!,
          filename: imageFileName ?? 'profile.jpg',
        )
            : await MultipartFile.fromFile(
          imagePath!,
          filename: imageFileName ?? imagePath.split('/').last,
        ),
    });
    final response = await apiServices.put(
      ApiEndpoint.updateProfileApi,
      data: formData,
    );

    return UserModelDto.fromJson(response.data);
  }
}