import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mock_mate_ai/api/api_endpoint.dart';
import 'package:mock_mate_ai/api/model/refresh/refresh_model_dto.dart';
import 'package:mock_mate_ai/data/data_source/remote/refresh/refresh_remote_data_source.dart';


@LazySingleton(as: RefreshRemoteDataSource)
class RefreshRemoteDataSourceImpl implements RefreshRemoteDataSource {
  final Dio dio;

  RefreshRemoteDataSourceImpl(this.dio);

  @override
  Future<RefreshModelDto> refresh(String refreshToken) async {
    final response = await dio.post(
      ApiEndpoint.refreshTokenApi,
      data: {"token": refreshToken},
    );

    return RefreshModelDto.fromJson(response.data);
  }
}
