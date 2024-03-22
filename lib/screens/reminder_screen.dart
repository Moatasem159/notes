import 'package:flutter/material.dart';
import 'package:notes/config/routes/app_routes.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/widgets/custom_drawer/main_drawer.dart';
class ReminderScreen extends StatelessWidget {
  const ReminderScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (_) {
        context.pushReplacementNamed(Routes.homeRoute);
      },
      child: Scaffold(
        backgroundColor:context.scaffoldBackground,
        drawer: const MainDrawer(),
        appBar: AppBar(),
      ),
    );
  }
}