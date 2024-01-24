import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restobarapp/routes/route_manager.dart';
import 'package:restobarapp/view_models/user_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserViewModel())
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
