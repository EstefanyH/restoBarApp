import 'package:flutter/material.dart';
import 'package:restobarapp/widgets/setting_form.dart';

class SettingView extends StatefulWidget {
  const SettingView({super.key});

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.indigo,
      ),
      backgroundColor: Colors.white,
      body: const SafeArea(
        child: Stack(
          children: [Padding(
            padding: EdgeInsets.all(0.0),
            child: SingleChildScrollView(
              child: SettingForm(),),)],)),
    );
  }
}