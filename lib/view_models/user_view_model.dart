import 'package:flutter/cupertino.dart';
import 'package:restobarapp/routes/route_manager.dart';

import '../widgets/dialogs.dart';

class UserViewModel with ChangeNotifier{
  final loginFormKey = GlobalKey<FormState>();
  final registerFormKey = GlobalKey<FormState>();

  void loginUserInUI(BuildContext context, {
    required String email, required String password
  }) async {
    FocusManager.instance.primaryFocus?.unfocus();
    if(loginFormKey.currentState?.validate() ?? false) {
      Navigator.of(context).popAndPushNamed(RouteManager.firstAppHomePage);
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