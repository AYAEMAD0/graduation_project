import 'package:injectable/injectable.dart';
import 'package:mock_mate_ai/api/api_endpoint.dart';
import 'package:mock_mate_ai/api/api_services.dart';
import 'package:mock_mate_ai/api/model/history/history_model.dart';
import 'package:mock_mate_ai/data/data_source/remote/history/history_remot_data_source.dart';

@Injectable(as: HistoryRemoteDataSource)
class HistoryRemotDataSourceImpl implements HistoryRemoteDataSource {
  final ApiServices apiServices;
  HistoryRemotDataSourceImpl(this.apiServices);
  @override
  Future<HistoryModel> getHistory(int pageIndex, int pageSize) async {
    final response = await apiServices.get(
      ApiEndpoint.historyApi,
      queryParameters: {'pageIndex': pageIndex, 'pageSize': pageSize},
    );
    return HistoryModel.fromJson(response.data);
  }
}
