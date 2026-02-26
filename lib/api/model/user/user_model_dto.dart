import '../../../domain/entities/user/user_entity.dart';

class UserModelDto {
  UserModelDto({
      this.userId, 
      this.displayName, 
      this.phoneNumber, 
      this.avatarPath,});

  UserModelDto.fromJson(dynamic json) {
    userId = json['userId'];
    displayName = json['displayName'];
    phoneNumber = json['phoneNumber'];
    avatarPath = json['avatarPath'];
  }
  int? userId;
  String? displayName;
  String? phoneNumber;
  String? avatarPath;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = userId;
    map['displayName'] = displayName;
    map['phoneNumber'] = phoneNumber;
    map['avatarPath'] = avatarPath;
    return map;
  }
  UserEntity toEntity() => UserEntity(
    userId: userId,
    displayName: displayName,
    phoneNumber: phoneNumber,
    avatarPath: avatarPath,
  );
}