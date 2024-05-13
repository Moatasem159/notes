import 'package:flutter/material.dart';
import 'package:notes/app/app.dart';
import 'package:notes/app/injection_container.dart'as di show init;
import 'package:notes/config/routes/app_routes.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(Nota(appRouter: AppRouter()));
}