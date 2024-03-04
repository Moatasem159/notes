import 'package:flutter/material.dart';
import 'package:notes/core/extension/context_extension.dart';
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:context.scaffoldBackground,
      appBar: AppBar(),
    );
  }
}