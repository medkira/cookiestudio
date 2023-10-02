import 'package:flutter/material.dart';
import 'package:cookiestudio/presentation/resources/routes_manager.dart';
import 'package:cookiestudio/presentation/resources/theme_manager.dart';

class MyApp extends StatefulWidget {
  // const MyApp({super.key}); // default constructor

  //named constructor
  const MyApp._internal();

  static const MyApp _instance =
      MyApp._internal(); //singleton or single instance
  factory MyApp() => _instance;
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
      theme: getApplicationTheme(),
    );
  }
}
