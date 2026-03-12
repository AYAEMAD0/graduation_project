import '../../../domain/entities/history/history_entity.dart';

class HistoryModelDto {
  List<InterviewItemModelDto>? data;
  int? totalCount;
  int? pageIndex;
  int? pageSize;
  int? totalPages;
  bool? hasNextPage;
  bool? hasPreviousPage;

  HistoryModelDto({
    this.data,
    this.totalCount,
    this.pageIndex,
    this.pageSize,
    this.totalPages,
    this.hasNextPage,
    this.hasPreviousPage,
  });

  HistoryModelDto.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(InterviewItemModelDto.fromJson(v));
      });
    }
    totalCount = json['totalCount'];
    pageIndex = json['pageIndex'];
    pageSize = json['pageSize'];
    totalPages = json['totalPages'];
    hasNextPage = json['hasNextPage'];
    hasPreviousPage = json['hasPreviousPage'];
  }
}

class InterviewItemModelDto {
  int? interviewSessionId;
  String? trackName;
  String? seniorityLevel;
  double? score;
  String? startDate;
  dynamic endDate;
  dynamic feedback;

  InterviewItemModelDto({
    this.interviewSessionId,
    this.trackName,
    this.seniorityLevel,
    this.score,
    this.startDate,
    this.endDate,
    this.feedback,
  });

  InterviewItemModelDto.fromJson(Map<String, dynamic> json) {
    interviewSessionId = json['interviewSessionId'];
    trackName = json['trackName'];
    seniorityLevel = json['seniorityLevel'];
    score = (json['score'] as num?)?.toDouble();
    startDate = json['startDate'];
    endDate = json['endDate'];
    feedback = json['feedback'];
  }

  DataEntity toEntity() {
    return DataEntity(
      interviewSessionId: interviewSessionId,
      trackName: trackName,
      seniorityLevel: seniorityLevel,
      score: score,
      startDate: startDate,
      endDate: endDate,
      feedback: feedback,
    );
  }
}
