import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restobarapp/misc/constants.dart';
import 'package:restobarapp/view_models/user_view_model.dart';

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
          style: style16White,),
          actions: [
            IconButton(onPressed: () { 
              context.read<UserViewModel>().logoutUserInUI(context);
            }, icon: const Icon(Icons.exit_to_app))
          ],),
          body: Center(
            child: const Text("Home Screen")
          ),
    );
  }
}