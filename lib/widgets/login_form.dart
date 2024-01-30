import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:restobarapp/view_models/user_view_model.dart';

import '../misc/constants.dart';
import '../misc/validators.dart';
import '../routes/route_manager.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  Future<Position> determinePosition() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('error');
      }
    }
    return await Geolocator.getCurrentPosition();
  }

  void getCurrentLocation() async {
    Position position = await determinePosition();
    print(position.latitude);
    print(position.longitude);
  }

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    getCurrentLocation();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<UserViewModel>().loginFormKey,
      child: Padding(
        padding: const EdgeInsets.all(20.0), 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBoxH30(),
            TextFormField(
              textInputAction: TextInputAction.next, 
              validator: validateEmail,
              controller: emailController,
              decoration: formDecoration('Email address', Icons.mail_outline),
            ),
            const SizedBoxH10(),
            TextFormField(
              textInputAction: TextInputAction.done, 
              validator: validatePassword,
              controller: passwordController,
              decoration: formDecoration('Password', Icons.lock_outline),
            ),
            const SizedBoxH20(),
            ButtonBar(
              alignment: MainAxisAlignment.end,
              children: [ 
                TextButton(
                  onPressed: (){ 
                    context.read<UserViewModel>().resetPasswordInUI(context, 
                    email: emailController.text.trim());
                  }, 
                  child: const Text(
                    'Forgot Password?', 
                    style: style16Black,)) ],
            ),
            //SIGN IN BUTTON
            CupertinoButton(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              color: Colors.indigo,
              child: const Text('Sign in', 
                style: style16White,), 
              onPressed: () {
                context.read<UserViewModel>().loginUserInUI(
                  context, 
                  email: emailController.text.trim(),
                  password: passwordController.text.trim());
              }),
            const SizedBoxH10(),
            CupertinoButton(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              color: Colors.white,
              child: const Text('Sign up',
              style: style16Indigo,),
              onPressed: () { 
                Navigator.popAndPushNamed(context, RouteManager.registerPage);
              })
          ],),),
    );
  }
}