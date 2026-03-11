class SignupEntity {
  int? userId;
  String? accessToken;
  String? refreshToken;

  String? code;
  String? message;
  Map<String, List<String>>? validationErrors;

  SignupEntity({
    this.userId,
    this.accessToken,
    this.refreshToken,
    this.code,
    this.message,
    this.validationErrors,
  });

}
