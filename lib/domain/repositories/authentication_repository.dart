import 'package:restobarapp/domain/response/login_response.dart';

abstract class AuthenticationRepository {
  Future<String?> get accessToken;
  Future<LoginResponse> login(String email, String psw);
}