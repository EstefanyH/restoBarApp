import 'package:flutter/material.dart';
import 'package:restobarapp/misc/constants.dart';

import '../routes/route_manager.dart';
import '../widgets/register_form.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, RouteManager.loginPage);
          },
          icon: const Icon(Icons.arrow_back_ios_new_sharp, 
          color: Colors.indigo,)),
        backgroundColor: Colors.white,
        //title: const Text("Sign up", 
        //  style: style16White,),
      ),
      backgroundColor: Colors.white,
     
      );
  }
}