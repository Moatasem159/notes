import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/models/note.dart';
import 'package:notes/widgets/note_widget/note_builder.dart';
class NoteWidget extends StatelessWidget {
  final Note note;
  final bool isGrid;
  const NoteWidget({super.key,required this.isGrid,required this.note});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 8),
      child: OpenContainer(
        closedElevation: 5,
        openElevation: 10,
        openColor: context.theme.colorScheme.background,
        closedColor: note.color == Colors.transparent.value
            ? context.theme.colorScheme.background
            : Color(note.color),
        middleColor: context.theme.colorScheme.background,
        closedShape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        openBuilder: (_, action) => const Placeholder(),
        closedBuilder: (_, action)=>NoteBuilder(note: note, isGrid: isGrid, onTap: action),
      ),
    );
  }
}
