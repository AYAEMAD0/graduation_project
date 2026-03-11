import '../../../../domain/entities/auth/logout/logout_entity.dart';

class LogoutModelDto {
  LogoutModelDto({
      this.message,});

  LogoutModelDto.fromJson(dynamic json) {
    message = json['message'];
  }
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    return map;
  }
  LogoutEntity toEntity() {
    return LogoutEntity(message: message!);
  }

}