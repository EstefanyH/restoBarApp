import 'dart:async';

import 'package:flutter/material.dart';
import 'package:restobarapp/misc/constants.dart';
import 'package:restobarapp/routes/route_manager.dart';

import '../widgets/app_progress_indicator.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {

  @override
  void initState() {
    Timer(const Duration(seconds: 5), () {
      Navigator.popAndPushNamed(context, RouteManager.loginPage);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("First Page",
            style: titleStyleIndigo),
          SizedBoxH20(),
          AppProgressIndicator(),
        ],),),
    );
  }
}