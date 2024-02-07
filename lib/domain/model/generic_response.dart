import 'package:restobarapp/domain/response/http_response.dart';

class GenericResponse {
  HttpResponse statusCode;
  String message;
  dynamic data;

  GenericResponse({
    required this.statusCode,
    required this.message,
    required this.data });
}