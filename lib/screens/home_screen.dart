import 'package:flutter/material.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/widgets/add_note_button/add_note_button.dart';
import 'package:notes/widgets/custom_drawer/main_drawer.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:context.scaffoldBackground,
      drawer: const MainDrawer(),
      appBar: AppBar(),
      floatingActionButton: const AddNoteButton(),
    );
  }
}