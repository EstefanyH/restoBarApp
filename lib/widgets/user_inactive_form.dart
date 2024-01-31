import 'package:flutter/material.dart';
import 'package:restobarapp/misc/constants.dart';

class UserInactiveForm extends StatefulWidget {
  const UserInactiveForm({super.key});

  @override
  State<UserInactiveForm> createState() => _UserInactiveFormState();
}

class _UserInactiveFormState extends State<UserInactiveForm> {
  @override
  Widget build(BuildContext context) {
    return const Form(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Usuarios Off", style: titleStyleIndigo,),
            SizedBoxH20()  
          ],),
        )
    );
  }
}