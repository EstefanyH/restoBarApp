import 'package:flutter/cupertino.dart';
import 'package:restobarapp/data/helpers/http.dart';
import 'package:restobarapp/domain/response/login_response.dart';
import 'package:restobarapp/misc/constants.dart';
import 'package:restobarapp/routes/route_manager.dart';
import '../data/data_source/remote/authentication_api.dart';
import '../data/repositories_impl/authentication_repository_impl.dart';
import '../domain/repositories/authentication_repository.dart';
import '../widgets/dialogs.dart';

class UserViewModel with ChangeNotifier{
  final loginFormKey = GlobalKey<FormState>();
  final registerFormKey = GlobalKey<FormState>();

  //final AuthenticationRepository _repository;

  //UserViewModel(this._repository);
  final AuthenticationRepository _repository = AuthenticationRepositoryImpl(
    AuthenticationAPI(Http(baseUrl: urlDomain)),
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
    _repository.login(email, password).then(
      (value) {
        if (value.name == LoginResponse.ok.name) {
          Navigator.of(context).popAndPushNamed(RouteManager.firstAppHomePage);
        } else {
          showSnackBar(context, 'Verificar el usuario y/o contraseña', 2000);
        }
      }
    );

      //showSnackBar();
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