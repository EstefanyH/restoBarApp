import 'package:restobarapp/domain/model/generic_response.dart';

abstract class GlobalRepository {
  Future<GenericResponse> get listParameter;
}