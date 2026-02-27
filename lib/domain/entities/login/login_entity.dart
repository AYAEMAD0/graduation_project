class LoginEntity {
  LoginEntity({
   required this.accessToken,
    required this.refreshToken,
    required this.role,
    required this.profile,});

  String accessToken;
  String refreshToken;
  String role;
  Profile profile;

}

class Profile {
  Profile({
    this.userName,
    this.email,
    this.displayName,
    this.avatarPath,});
  String? userName;
  String? email;
  String? displayName;
  String? avatarPath;

}