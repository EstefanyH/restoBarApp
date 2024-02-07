
import 'package:restobarapp/data/data_source/remote/global_api.dart';
import 'package:restobarapp/domain/model/generic_response.dart';

import '../../domain/repositories/global_repository.dart';

class GlobalRepositoryImpl implements GlobalRepository {
  
  final GlobalAPI _api;
  GlobalRepositoryImpl(this._api);

  @override
  Future<GenericResponse> get listParameter async {
    return _api.parameters();
  }
  
}