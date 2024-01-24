import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restobarapp/misc/constants.dart';

import '../misc/validators.dart';
import '../view_models/user_view_model.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  
  late TextEditingController nameController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late TextEditingController emailController;
  
  @override
  void initState(){
    super.initState();
    nameController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    emailController = TextEditingController();
  }

  @override
  void dispose(){
    nameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<UserViewModel>().registerFormKey,
      child: Padding(
        padding: const EdgeInsets.all(20.0), 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center, 
          children: [
            const Text("Create Account", 
              style: titleStyleIndigo,),
            const SizedBoxH20(),
            TextFormField(
            validator: validateName, 
            controller: nameController,
            decoration: formDecoration("Name", Icons.person_outline),),
            const SizedBoxH10(),
            TextFormField(
            validator: validateEmail, 
            controller: emailController,
            decoration: formDecoration("Email address", Icons.mail_outline),),
            const SizedBoxH10(),
            TextFormField(
            validator: validatePassword, 
            controller: passwordController,
            decoration: formDecoration("Password", Icons.lock_outline),),
            const SizedBoxH10(),
            TextFormField(
            validator: validateConfirmPassword, 
            controller: confirmPasswordController,
            decoration: formDecoration("Confirm Password", Icons.lock_outline),),
            const SizedBoxH20(),
            CupertinoButton(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              color: Colors.indigo,
              child: const Text("Sign up", style: style16White,), 
              onPressed: () {
                context.read<UserViewModel>().createdUserInUI(context, 
                name: nameController.text.trim(), 
                email: emailController.text.trim(), 
                password: passwordController.text.trim(), 
                confirmPassword: confirmPasswordController.text.trim());
               }
              ) 
          ],),),
    );
  }
}