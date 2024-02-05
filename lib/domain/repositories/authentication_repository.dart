import 'package:restobarapp/domain/response/http_response.dart';

abstract class AuthenticationRepository {
  Future<String?> get accessToken;
  Future<HttpResponse> login(String email, String psw);
}