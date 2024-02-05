
import 'package:restobarapp/data/data_source/remote/global_api.dart';
import 'package:restobarapp/domain/response/http_response.dart';

import '../../domain/repositories/global_repository.dart';

class GlobalRepositoryImpl implements GlobalRepository {
  
  final GlobalAPI _api;
  GlobalRepositoryImpl(this._api);

  @override
  Future<HttpResponse> get listParameter async {
    return _api.parameters();
  }
  
}