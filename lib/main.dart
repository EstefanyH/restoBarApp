import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restobarapp/routes/route_manager.dart';
import 'package:restobarapp/service/local_storage.dart';
import 'package:restobarapp/view_models/search_view_model.dart';
import 'package:restobarapp/view_models/user_inactive_view_model.dart';
import 'package:restobarapp/view_models/user_view_model.dart';

void main()  {
  //await LocalStorage.configurePrefs();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserViewModel()),
        ChangeNotifierProvider(create: (context) => SearchViewModel()),
        ChangeNotifierProvider(create: (context) => UsuarioInactivoViewModel())
      ],
      child: MaterialApp( 
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteManager.onGenerationRoute,
        initialRoute: RouteManager.loadingPage,
        theme: ThemeData( 
          primarySwatch: Colors.indigo
          ),
      ),
    );
  }
}
