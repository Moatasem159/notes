import 'package:flutter/material.dart';
import 'package:notes/app/app.dart';
import 'package:notes/app/injection_container.dart'as di show init;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}