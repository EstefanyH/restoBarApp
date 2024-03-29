import 'package:flutter/material.dart';
import 'package:restobarapp/pages/first_app_home.dart';
import 'package:restobarapp/pages/loading_page.dart';

import '../pages/login_page.dart';
import '../pages/register_page.dart';

class RouteManager {
  static const String loadingPage = '/';
  static const String loginPage = '/loginPage';
  static const String registerPage = 'registerPage';
  static const String firstAppHomePage = 'firstAppHomePage';

  static Route<dynamic>? onGenerationRoute(RouteSettings settings) {
    switch(settings.name){
      case loadingPage: 
        return MaterialPageRoute(builder: (context) => const LoadingPage());
      case loginPage:
        return MaterialPageRoute(builder: (context) => const LoginPage());
      case registerPage:
        return MaterialPageRoute(builder: (context) => const RegisterPage());
      case firstAppHomePage:
        return MaterialPageRoute(builder: (context) => const FirstAppHome());
      default:
        throw Exception("No route found!");
    }
  }
}