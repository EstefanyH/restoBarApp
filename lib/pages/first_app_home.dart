import 'package:flutter/material.dart';
import 'package:restobarapp/misc/constants.dart';

class FirstAppHome extends StatefulWidget {
  const FirstAppHome({super.key});

  @override
  State<FirstAppHome> createState() => _FirstAppHomeState();
}

class _FirstAppHomeState extends State<FirstAppHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First App', 
          style: style16White,),),
          body: Center(
            child: const Text("Home Screen")
          ),
    );
  }
}