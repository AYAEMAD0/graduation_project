class LoginModelDto {
  LoginModelDto({
      this.accessToken, 
      this.refreshToken, 
      this.role, 
      this.profile,});

  LoginModelDto.fromJson(dynamic json) {
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
    role = json['role'];
    profile = json['profile'] != null ? Profile.fromJson(json['profile']) : null;
  }
  String? accessToken;
  String? refreshToken;
  String? role;
  Profile? profile;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['accessToken'] = accessToken;
    map['refreshToken'] = refreshToken;
    map['role'] = role;
    if (profile != null) {
      map['profile'] = profile?.toJson();
    }
    return map;
  }

}

class Profile {
  Profile({
      this.userName, 
      this.email, 
      this.displayName, 
      this.avatarPath,});

  Profile.fromJson(dynamic json) {
    userName = json['userName'];
    email = json['email'];
    displayName = json['displayName'];
    avatarPath = json['avatarPath'];
  }
  String? userName;
  String? email;
  String? displayName;
  String? avatarPath;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userName'] = userName;
    map['email'] = email;
    map['displayName'] = displayName;
    map['avatarPath'] = avatarPath;
    return map;
  }

}