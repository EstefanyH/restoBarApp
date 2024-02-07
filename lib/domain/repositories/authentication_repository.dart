import 'package:restobarapp/domain/model/generic_response.dart';

abstract class AuthenticationRepository {
  Future<String?> get accessToken;
  Future<GenericResponse> login(String email, String psw);
}