
import 'package:restobarapp/domain/model/generic_response.dart';
import 'package:restobarapp/domain/response/http_response.dart';

class Functions {

  GenericResponse responseFromJson(HttpResponse statusCode, String msg, dynamic data){
    var _response = GenericResponse(
      statusCode:  statusCode,
      message: msg,
      data: data
    );
    return _response;
  }
}
