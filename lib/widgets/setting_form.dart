import 'package:flutter/material.dart';
import 'package:restobarapp/misc/constants.dart';

class SettingForm extends StatefulWidget {
  const SettingForm({super.key});

  @override
  State<SettingForm> createState() => _SettingFormState();
}

class _SettingFormState extends State<SettingForm> {
  @override
  Widget build(BuildContext context) {
    return const Form(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Configuración", style: titleStyleIndigo,),
            SizedBoxH20()  
          ],),
        )
    );
  }
}