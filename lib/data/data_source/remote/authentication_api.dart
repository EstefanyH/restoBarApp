
import 'dart:async';
import 'dart:io';

import 'package:restobarapp/data/helpers/http_method.dart';
import 'package:restobarapp/domain/response/login_response.dart';

import '../../helpers/http.dart';

class AuthenticationAPI {
  final Http _http;

  AuthenticationAPI(this._http);

  Future<LoginResponse> login(String email, String psw) async {
    final result = await _http.request('/api/login',
    method: HttpMethod.post,
    body: {
      "email": email,
      "password": psw
    });

    print("result data ${result.data}");
    print("result data runtimeType ${result.data.runtimeType}");
    print("result error data ${result.error?.data}");
    print("result statusCode ${result.statusCode}");

    if (result.error == null){
      return LoginResponse.ok;
    } 

    if (result.statusCode == 400) {
      return LoginResponse.accessDenied;
    }

    final error = result.error!.exception;
    
    if (error is SocketException || error is TimeoutException) {
      return LoginResponse.networkError;
    }

    return LoginResponse.unknowError;

  }
}