import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../domain/model/user.dart';
import '../view_models/user_inactive_view_model.dart';

class UserInactiveForm extends StatefulWidget {
  const UserInactiveForm({super.key});

  @override
  State<UserInactiveForm> createState() => _UserInactiveFormState();
}

class _UserInactiveFormState extends State<UserInactiveForm> {

  //final titles = ["List 1","List 2","List 3"];
  //final subtitles = ["Here is list 1","Here is list list 2","List 3"];
  //final icons = [Icons.ac_unit, Icons.access_alarm, Icons.access_time];

  @override
  Widget build(BuildContext context) {
    return Consumer<UsuarioInactivoViewModel>(
      builder: (context, viewModel, child){

        if(viewModel.items.isEmpty){
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          
          return ListView.builder(
            shrinkWrap: true,
            itemCount: viewModel.items.length, 
            itemBuilder: (context, index){
              Usuario item = viewModel.items[index];
              return ListTile(
                title: Text(item.Nombre),
                subtitle: Text(item.Hora),);
          });
        }
      },
    );
    /*return ListView.builder(
        itemCount: titles.length,
        itemBuilder: (context, index) {
          return Card(
              child: ListTile(
                  onTap: () {
                    /*Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text(titles[index] + ' pressed!'),
                    ));*/
                  },
                  title: Text(titles[index]),
                  subtitle: Text(subtitles[index]),
                  leading: const CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://images.unsplash.com/photo-1547721064-da6cfb341d50")),
                  trailing: Icon(icons[index])));
        });*/
  }
}