import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restobarapp/misc/constants.dart';
import 'package:restobarapp/pages/views/maps_view.dart';
import 'package:restobarapp/pages/views/point_view.dart';
import 'package:restobarapp/pages/views/user_inactive_view.dart';
import 'package:restobarapp/view_models/user_view_model.dart';

class FirstAppHome extends StatefulWidget {
  const FirstAppHome({super.key});

  @override
  State<FirstAppHome> createState() => _FirstAppHomeState();
}

int selectIndex = 0;

class _FirstAppHomeState extends State<FirstAppHome> {
  
  final screens = [const MpasView(), const PointsView(), const UserInactiveView()];

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
          body: IndexedStack(
            index: selectIndex,
            children: screens,),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.shifting,
            currentIndex: selectIndex,
            onTap: (value) {
              setState(() {
                selectIndex = value;
              });
            },
            elevation: 0,
            items: const [
               BottomNavigationBarItem(
                icon:  Icon(Icons.search_outlined),
                activeIcon: Icon(Icons.search),
                label: 'Buscar',
                backgroundColor: Colors.indigo),
              BottomNavigationBarItem(
                icon: Icon(Icons.map_outlined),
                activeIcon: Icon(Icons.map),
                label: 'Puntos',
                backgroundColor: Colors.indigo),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_3_outlined),
                activeIcon: Icon(Icons.person_3),
                label: 'Inactivos',
                backgroundColor: Colors.indigo),
              ],
            ),
    );
  }
}