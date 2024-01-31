import 'package:flutter/material.dart';
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
      ),
      backgroundColor: Colors.white,
      body: const SafeArea(
        child: Stack(
          children: [Padding(
            padding: EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: SearchForm(),),)],)),
    );
  }
}