import 'package:mock_mate_ai/domain/entities/auth/login/login_entity.dart';

abstract class LoginRepo {
  Future<LoginEntity> login ({required String email, required String password});
}