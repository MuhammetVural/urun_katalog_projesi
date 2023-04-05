import 'package:flutter/material.dart';



class MyApp extends StatefulWidget {
  MyApp._internal(); // private named constractor

  static final MyApp instance =
      MyApp._internal(); // single instance ya da singleton

  int appState = 0;

  factory MyApp() => instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
    );
  }
}
