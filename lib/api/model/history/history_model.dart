import 'package:mock_mate_ai/domain/entities/history/history_Interview_entity.dart';

class HistoryModel {
  List<InterviewItemModel>? data;
  num? totalCount;
  num? pageIndex;
  num? pageSize;

  HistoryModel({this.data, this.totalCount, this.pageIndex, this.pageSize});

  HistoryModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(InterviewItemModel.fromJson(v));
      });
    }
    totalCount = json['totalCount'];
    pageIndex = json['pageIndex'];
    pageSize = json['pageSize'];
  }
}

class InterviewItemModel {
  int? id;
  String? position;
  num? overallScore;
  String? status;
  String? createdAt;

  InterviewItemModel({this.id, this.position, this.overallScore, this.status, this.createdAt});

  InterviewItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    position = json['position'];
    overallScore = json['overallScore'];
    status = json['status'];
    createdAt = json['createdAt'];
  }

  HistoryInterviewEntity toEntity() {
    return HistoryInterviewEntity(
      id: id ?? 0,
      position: position ?? "Unknown",
      score: (overallScore ?? 0).toDouble(),
      status: status ?? "",
      date: createdAt ?? "",
    );
  }
}