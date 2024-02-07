import 'package:flutter/cupertino.dart';
import 'package:restobarapp/data/data_source/remote/global_api.dart';
import 'package:restobarapp/data/helpers/http.dart';
import 'package:restobarapp/data/repositories_impl/global_repository_impl.dart';
import 'package:restobarapp/domain/repositories/global_repository.dart';
import 'package:restobarapp/domain/response/http_response.dart';
import 'package:restobarapp/global/shared_variable.dart';
import 'package:restobarapp/routes/route_manager.dart';
import 'package:restobarapp/service/local_storage.dart';
import '../data/data_source/remote/authentication_api.dart';
import '../data/repositories_impl/authentication_repository_impl.dart';
import '../domain/repositories/authentication_repository.dart';
import '../widgets/dialogs.dart';
import 'package:restobarapp/global/api_service.dart';

class UserViewModel with ChangeNotifier{
  final loginFormKey = GlobalKey<FormState>();
  final registerFormKey = GlobalKey<FormState>();

  final AuthenticationRepository _repository = AuthenticationRepositoryImpl(
    AuthenticationAPI(Http(baseUrl: ApiService.urlDomain)),
  );

  final GlobalRepository _globalRepository = GlobalRepositoryImpl(
    GlobalAPI(Http(baseUrl: ApiService.urlDomain)),
  );

/*
  final http = Http(baseUrl: urlDomain);
  final AuthenticationRepository auth = AuthenticationRepositoryImpl(
    AuthenticationAPI(http),
  );*/

  void loginUserInUI(BuildContext context, { 
    required String email, required String password
  }) async {
    FocusManager.instance.primaryFocus?.unfocus();
    if(loginFormKey.currentState?.validate() ?? false) {
  
 //'eve.holt@reqres.in', 'cityslicka'
    _repository.login(email, password).then( (value) {
      if (value.statusCode == HttpResponse.ok.name) {

        //obtener parametros
        _globalRepository.listParameter.then((value) async {
          if (value.statusCode == HttpResponse.ok ) {

            await LocalStorage.setParameter(prefs_parameters,value.data.toString());

            Navigator.of(context).popAndPushNamed(RouteManager.firstAppHomePage);
          }
        });
       
      } else {
        showSnackBar(context, 'Verificar el usuario y/o contraseña', 2000);
      }
    });
   
   

    }
  }

  void createdUserInUI(BuildContext context, {
    required String name, 
    required String email, 
    required String password, 
    required String confirmPassword}) async {
      FocusManager.instance.primaryFocus?.unfocus();

      if(registerFormKey.currentState?.validate() ?? false) {
        if(confirmPassword.toString().trim() != password) { 

          showSnackBar(context, 'password do not match', 2000);
        }
        else {
          Navigator.of(context).popAndPushNamed(RouteManager.firstAppHomePage);
        }
      }
  }

  void logoutUserInUI(BuildContext context) async {
    Navigator.popAndPushNamed(context, RouteManager.loginPage);
  } 

  void resetPasswordInUI(BuildContext context, {required String email}) async {
    if (email.isEmpty){
      showSnackBar(context, 'Please enter email address and click on "Reset Password"', 4000);
    } else {
      showSnackBar(context, 'Reset instruction sent to $email', 4000);
    }
  }
}