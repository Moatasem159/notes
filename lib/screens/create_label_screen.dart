import 'package:flutter/material.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/widgets/custom_drawer/main_drawer.dart';
class CreateLabelScreen extends StatelessWidget {
  const CreateLabelScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:context.scaffoldBackground,
      drawer: const MainDrawer(),
      appBar: AppBar(),
    );
  }
}