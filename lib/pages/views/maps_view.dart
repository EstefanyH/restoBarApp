import 'package:flutter/material.dart';
import 'package:restobarapp/misc/constants.dart';

import '../../routes/route_manager.dart';
import '../../widgets/maps_form.dart';

class MapsView extends StatefulWidget {
  const MapsView({super.key});

  @override
  State<MapsView> createState() => _MapsViewState();
}

class _MapsViewState extends State<MapsView> { 
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, RouteManager.firstAppHomePage);
          },
          icon: const Icon(Icons.arrow_back_ios_new_sharp, 
          color: Colors.indigo,)),
        backgroundColor: Colors.white,
        title: const Text('Tracking', style: style16Indigo,),
        actions: [
            IconButton(onPressed: () { 
              //context.read<UserViewModel>().logoutUserInUI(context);
            }, icon: const Icon(Icons.update, color: Colors.indigo,))
          ] 
      ),
      backgroundColor: Colors.white,
      body: const SafeArea(
        child: MapsForm()),
      );
  }
}