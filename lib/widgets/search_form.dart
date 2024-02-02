import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restobarapp/misc/constants.dart';
import 'package:restobarapp/view_models/search_view_model.dart';

import '../routes/route_manager.dart';

class SearchForm extends StatefulWidget {
  const SearchForm({Key? key}) : super(key: key);

  @override
  State<SearchForm> createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  
  String _dropdownValue = 'Item 1';    
  var items = [     
    'Item 1', 
    'Item 2', 
    'Item 3', 
    'Item 4', 
    'Item 5', 
  ]; 

  void dropdownCallback(String? selectValue){
    if (selectValue is String) {
      setState(() {
        _dropdownValue = selectValue;
      });
    }
  }

  
  @override
  Widget build(BuildContext context) {


    return Form(
      key: context.read<SearchViewModel>().searchFormKey,
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            DropdownButtonFormField(
              isExpanded: true,
              hint: const Text("Elegir"),
              value: _dropdownValue,
              decoration: const InputDecoration(
                border: OutlineInputBorder()
              ),
              items: items.map((String items) { 
                return DropdownMenuItem( 
                  value: items, 
                  child: Text(items), 
                ); 
              }).toList(), 
              onChanged: (String? newValue) => setState(() { 
                  _dropdownValue = newValue!; 
                }), 
            ),
            const SizedBoxH10(),
            DropdownButtonFormField(
              isExpanded: true,
              hint: const Text("Elegir"),
              value: _dropdownValue, 
              decoration: const InputDecoration(
                border: OutlineInputBorder()
              ),
              items: items.map((String items) { 
                return DropdownMenuItem( 
                  value: items, 
                  child: Text(items), 
                ); 
              }).toList(), 
              onChanged: (String? newValue) => setState(() { 
                  _dropdownValue = newValue!; 
                }), 
            ),
            const SizedBoxH10(),
            DropdownButtonFormField(
              isExpanded: true,
              hint: const Text("Elegir"),
              value: _dropdownValue, 
              decoration: const InputDecoration(
                border: OutlineInputBorder()
              ),
              items: items.map((String items) { 
                return DropdownMenuItem( 
                  value: items, 
                  child: Text(items), 
                ); 
              }).toList(), 
              onChanged: (String? newValue) => setState(() { 
                  _dropdownValue = newValue!; 
                }), 
            ),
            const SizedBoxH10(),
            DropdownButtonFormField(
              isExpanded: true,
              hint: const Text("Elegir"),
              value: _dropdownValue, 
              decoration: const InputDecoration(
                border: OutlineInputBorder()
              ),
              items: items.map((String items) { 
                return DropdownMenuItem( 
                  value: items, 
                  child: Text(items), 
                ); 
              }).toList(), 
              onChanged: (String? newValue) => setState(() { 
                  _dropdownValue = newValue!; 
                }), 
            ),
            const SizedBoxH20(),
            CupertinoButton(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              color: Colors.indigo,
              child: const Text("Buscar", style: style16White,), 
              onPressed: () { 
                Navigator.popAndPushNamed(context, RouteManager.mapsView);
               },
              )
          ],),
        )
    );
  }
}