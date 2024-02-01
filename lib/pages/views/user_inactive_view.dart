import 'package:flutter/material.dart';
import 'package:restobarapp/misc/constants.dart';
import 'package:restobarapp/widgets/user_inactive_form.dart';

class UserInactiveView extends StatefulWidget {
  const UserInactiveView({super.key});

  @override
  State<UserInactiveView> createState() => _UserInactiveViewState();
}

class _UserInactiveViewState extends State<UserInactiveView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.indigo,
        title: const Text("Usuarios Off", style: titleStyleWhite ),
         actions: [
            IconButton(onPressed: () { 
              //context.read<UserViewModel>().logoutUserInUI(context);
            }, icon: const Icon(Icons.update, color: Colors.white,))
          ]
      ),
      backgroundColor: Colors.white,
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(child: UserInactiveForm())
          ],),
      ),
      /*body: const SafeArea(
        child: Stack(
          children: [Padding(
            padding: EdgeInsets.all(15.0),
            child: Center(child: SingleChildScrollView(
              child: UserInactiveForm(),),),
          )],
        )
      ),*/
    );
  }
}