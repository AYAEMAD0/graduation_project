class HistoryEntity {
  HistoryEntity({
    this.data,
    this.totalCount,
    this.pageIndex,
    this.pageSize,
    this.totalPages,
    this.hasNextPage,
    this.hasPreviousPage,
  });

  List<DataEntity>? data;
  int? totalCount;
  int? pageIndex;
  int? pageSize;
  int? totalPages;
  bool? hasNextPage;
  bool? hasPreviousPage;
}

class DataEntity {
  DataEntity({
    this.interviewSessionId,
    this.trackName,
    this.seniorityLevel,
    this.interviewType,
    this.score,
    this.startDate,
    this.endDate,
    this.feedback,
  });

  int? interviewSessionId;
  String? trackName;
  String? seniorityLevel;
  String? interviewType;
  double? score;
  String? startDate;
  dynamic endDate;
  dynamic feedback;
}