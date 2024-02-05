import '../response/http_response.dart';

abstract class GlobalRepository {
  Future<HttpResponse> get listParameter;
}