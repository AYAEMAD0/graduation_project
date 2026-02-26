class SignupModelDto {
  int? userId;
  String? accessToken;
  String? refreshToken;

  String? code;
  String? message;
  Map<String, List<String>>? validationErrors;

  SignupModelDto({
    this.userId,
    this.accessToken,
    this.refreshToken,
    this.code,
    this.message,
    this.validationErrors,
  });

  SignupModelDto.fromJson(dynamic json) {
    userId = json['userId'];
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];

    code = json['code'];
    message = json['message'];

    if (json['validationErrors'] != null) {
      validationErrors = <String, List<String>>{};
      (json['validationErrors'] as Map<String, dynamic>)
          .forEach((key, value) {
        validationErrors![key] = List<String>.from(value);
      });
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'accessToken': accessToken,
      'refreshToken': refreshToken,
      'code': code,
      'message': message,
      'validationErrors': validationErrors,
    };
  }
}
