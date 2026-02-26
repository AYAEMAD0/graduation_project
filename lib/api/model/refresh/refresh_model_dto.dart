class RefreshModelDto {
  final String accessToken;
  final String refreshToken;

  RefreshModelDto({
    required this.accessToken,
    required this.refreshToken,
  });

  factory RefreshModelDto.fromJson(Map<String, dynamic> json) {
    return RefreshModelDto(
      accessToken: json['accessToken'] ?? '',
      refreshToken: json['refreshToken'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accessToken': accessToken,
      'refreshToken': refreshToken,
    };
  }
}
