import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:notes/app/app.dart';
import 'package:notes/app/injection_container.dart'as di show init;
import 'package:notes/config/routes/app_routes.dart';
import 'package:notes/core/notification/app_notification.dart';
void main() async{
  WidgetsBinding widgetsBinding=WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await di.init();
  runApp(Nota(appRouter: AppRouter()));
  await NotificationManager.handleBackground();
  FlutterNativeSplash.remove();
}