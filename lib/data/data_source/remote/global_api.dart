import 'dart:async';
import 'dart:io';

import 'package:restobarapp/data/helpers/http.dart';
import 'package:restobarapp/domain/model/generic_response.dart';
import 'package:restobarapp/domain/response/http_response.dart';
import 'package:restobarapp/global/functions.dart';

import '../../../global/api_service.dart';
import '../../helpers/http_method.dart';

class GlobalAPI {
  final Http _http;
  final _functions =  Functions();

  GlobalAPI(this._http);

  Future<GenericResponse> parameters() async {
    final result = await _http.request(ApiService.parameter+'?page=2',
    method: HttpMethod.get,
    body: null);

    //print("result data ${result.data}");
    //print("result data runtimeType ${result.data.runtimeType}");
    //print("result error data ${result.error?.data}");
    //print("result statusCode ${result.statusCode}");

    if (result.error == null){
      return _functions.responseFromJson(HttpResponse.ok, "", result.data);
    } 

    if (result.statusCode == 400) {
      //return HttpResponse.accessDenied;
      return _functions.responseFromJson(HttpResponse.accessDenied, "", null);
    }

    final error = result.error!.exception;
    
    if (error is SocketException || error is TimeoutException) {
      //return HttpResponse.networkError;
      return _functions.responseFromJson(HttpResponse.networkError, "", null);
    }

    //return HttpResponse.unknowError;
    return _functions.responseFromJson(HttpResponse.unknowError, "", null);
  }

}