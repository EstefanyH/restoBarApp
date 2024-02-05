import 'dart:async';
import 'dart:io';

import 'package:restobarapp/data/helpers/http.dart';
import 'package:restobarapp/domain/response/http_response.dart';

import '../../../global/api_service.dart';
import '../../helpers/http_method.dart';

class GlobalAPI {
  final Http _http;

  GlobalAPI(this._http);

  Future<HttpResponse> parameters() async {
    final result = await _http.request(ApiService.parameter,
    method: HttpMethod.get,
    body: {
      "page": 2
    });

    print("result data ${result.data}");
    print("result data runtimeType ${result.data.runtimeType}");
    print("result error data ${result.error?.data}");
    print("result statusCode ${result.statusCode}");

    if (result.error == null){
      return HttpResponse.ok;
    } 

    if (result.statusCode == 400) {
      return HttpResponse.accessDenied;
    }

    final error = result.error!.exception;
    
    if (error is SocketException || error is TimeoutException) {
      return HttpResponse.networkError;
    }

    return HttpResponse.unknowError;

  }

}