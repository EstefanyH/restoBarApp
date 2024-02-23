
import 'package:restobarapp/data/data_source/remote/authentication_api.dart';
import 'package:restobarapp/domain/model/generic_response.dart';
import 'package:restobarapp/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  
  final AuthenticationAPI _api;
  AuthenticationRepositoryImpl(this._api);

  @override
  Future<String?> get accessToken async {
    await Future.delayed(const Duration(seconds: 1));
    return "null";
  }

  @override
  Future<GenericResponse> login(String email, String psw) {
    return _api.login(email, psw);
  }

}