
import 'dart:async';
import 'dart:io';

import 'package:restobarapp/data/helpers/http_method.dart';
import 'package:restobarapp/domain/model/generic_response.dart';
import 'package:restobarapp/domain/response/http_response.dart';
import 'package:restobarapp/global/api_service.dart'; 
import 'package:restobarapp/global/functions.dart';
import '../../helpers/http.dart';

class AuthenticationAPI {
  final Http _http;
  final _functions =  Functions();

  AuthenticationAPI(this._http, );

  Future<GenericResponse> login(String email, String psw) async {
    final result = await _http.request(ApiService.login,
    method: HttpMethod.post,
    body: {
      "email": email,
      "password": psw
    });

    //print("result data ${result.data}");
    //print("result data runtimeType ${result.data.runtimeType}");
    //print("result error data ${result.error?.data}");
    //print("result statusCode ${result.statusCode}");

    if (result.error == null){
      //return HttpResponse.ok;
      return _functions.responseFromJson(HttpResponse.ok,"",result.data);
    } 

    if (result.statusCode == 400) {
      //return HttpResponse.accessDenied;
      return _functions.responseFromJson(HttpResponse.accessDenied,"",null);
    }

    final error = result.error!.exception;
    
    if (error is SocketException || error is TimeoutException) {
      //return HttpResponse.networkError;
      return _functions.responseFromJson(HttpResponse.networkError,"",null);
    }

    //return HttpResponse.unknowError;
    return _functions.responseFromJson(HttpResponse.unknowError,"",null);
  }


}