import 'package:flutter/cupertino.dart';
import 'package:restobarapp/routes/route_manager.dart';

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
}