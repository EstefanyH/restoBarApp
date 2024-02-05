import 'package:flutter/material.dart';
import 'package:restobarapp/misc/constants.dart';
import 'package:restobarapp/routes/route_manager.dart';

class SettingForm extends StatefulWidget {
  const SettingForm({super.key});

  @override
  State<SettingForm> createState() => _SettingFormState();
}

class _SettingFormState extends State<SettingForm> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return  ListView(
      children: <Widget>[
        ListTile(
          leading: const Icon(Icons.gps_fixed, color: Colors.blue, ),
          trailing: Switch(
            value: false, 
            activeColor: Colors.pink,
            activeTrackColor: Colors.pinkAccent,
            onChanged: (value){
              setState(() {
                isSwitched = value;
              });
            }),
          title: const Text('Ubicación', style: style16Black,),
          subtitle: const Text('Permiso'),
          onTap: () {
            // Handle item tap
            print('Tapped on Item 1');
          },
        ),
        const Divider(height: 10.0,),
        ListTile(
          leading: const Icon(Icons.door_back_door, color: Colors.blue,),
          title: const Text('Cerrar sesión'),
          onTap: () {
            // Handle item tap
            Navigator.popAndPushNamed(context, RouteManager.loginPage);
          },
        ),
      ],
    );
  }
}