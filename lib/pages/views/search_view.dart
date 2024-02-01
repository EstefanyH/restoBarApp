import 'package:flutter/material.dart';
import 'package:restobarapp/misc/constants.dart';
import 'package:restobarapp/widgets/search_form.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.indigo,
        title: const Text("Busqueda", style: titleStyleWhite ),
        
      ),
      backgroundColor: Colors.white,
      body: const SafeArea(
        child: Stack(
          children: [
            
            Padding(
              padding: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0, top: 50),
              child: SingleChildScrollView(
                child: SearchForm(),
              ),
            )
          ],
        )
      ),
    );
  }
}