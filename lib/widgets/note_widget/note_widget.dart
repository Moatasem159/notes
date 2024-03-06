import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/cubits/get_active_notes_cubit/get_active_notes_cubit.dart';
import 'package:notes/models/note.dart';
import 'package:notes/screens/add_note_screen.dart';
import 'package:notes/widgets/note_widget/note_builder.dart';

class NoteWidget extends StatelessWidget {
  final Note note;
  final bool isGrid;

  const NoteWidget({super.key, required this.isGrid, required this.note});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 8),
      child: OpenContainer(
        closedElevation: 5,
        openElevation: 10,
        openColor: context.scaffoldBackground,
        closedColor: note.color == Colors.transparent.value
            ? context.scaffoldBackground
            : Color(note.color),
        middleColor: context.scaffoldBackground,
        closedShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        openBuilder: (_, action) {
          if (note.status == NoteStatus.active) {
            return BlocProvider.value(
                value: GetActiveNotesCubit.of(context),
                child: AddNoteScreen(note: note));
          } else {
            return AddNoteScreen(note: note);
          }
        },
        closedBuilder: (_, action) =>
            NoteBuilder(note: note, isGrid: isGrid, onTap: action),
      ),
    );
  }
}
