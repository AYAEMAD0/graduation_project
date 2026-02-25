class LoginEntity {
  final String accessToken;
  final String refreshToken;
  final String email;
  final String userName;
  final String role;

  LoginEntity({
    required this.accessToken,
    required this.refreshToken,
    required this.email,
    required this.userName,
    required this.role,
  });
}
