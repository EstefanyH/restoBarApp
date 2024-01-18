import 'package:flutter/material.dart';
import 'package:restobarapp/routes/route_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteManager.onGenerationRoute,
      initialRoute: RouteManager.loadingPage,
      theme: ThemeData( 
        primarySwatch: Colors.blue
      ),
    );
  }
}
