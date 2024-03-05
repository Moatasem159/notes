import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/screens/add_note_screen.dart';
import 'package:notes/widgets/add_note_button/add_note_button_builder.dart';
class AddNoteButton extends StatelessWidget {
  const AddNoteButton({super.key});
  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      transitionDuration: const Duration(milliseconds: 300),
      openColor:context.theme.colorScheme.background,
      closedColor: context.theme.colorScheme.onSecondary,
      middleColor: context.theme.colorScheme.background,
      closedElevation: 10,
      openElevation: 10,
      closedShape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      openBuilder:(_, action) =>const AddNoteScreen(),
      closedBuilder:(_, action) => AddNoteButtonBuilder(onTap: action),
    );
  }
}
// left: context.width / 1.357,
// bottom: context.height - 707,