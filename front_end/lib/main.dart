import 'package:cookiestudio/app/di.dart';
import 'package:flutter/material.dart';
import 'package:cookiestudio/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  runApp(MyApp());
}
