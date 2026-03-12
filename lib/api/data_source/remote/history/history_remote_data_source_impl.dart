import 'package:injectable/injectable.dart';
import 'package:mock_mate_ai/api/api_endpoint.dart';
import 'package:mock_mate_ai/api/api_services.dart';
import 'package:mock_mate_ai/api/model/history/history_model_dto.dart';
import 'package:mock_mate_ai/data/data_source/remote/history/history_remote_data_source.dart';

@Injectable(as: HistoryRemoteDataSource)
class HistoryRemoteDataSourceImpl implements HistoryRemoteDataSource {
  final ApiServices apiServices;

  HistoryRemoteDataSourceImpl(this.apiServices);

  @override
  Future<HistoryModelDto> getHistory(int pageIndex, int pageSize) async {
    final response = await apiServices.get(
      ApiEndpoint.historyApi,
      queryParameters: {'pageIndex': pageIndex, 'pageSize': pageSize},
    );
    return HistoryModelDto.fromJson(response.data);
  }
}

