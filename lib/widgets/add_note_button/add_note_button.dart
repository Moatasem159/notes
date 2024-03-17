import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/cubits/app_bar_cubit/app_bar_cubit.dart';
import 'package:notes/cubits/get_labeled_notes_cubit/get_labeled_notes_cubit.dart';
import 'package:notes/models/label.dart';
import 'package:notes/models/note.dart';
import 'package:notes/screens/add_note_screen.dart';
import 'package:notes/widgets/add_note_button/add_note_button_builder.dart';
class AddNoteButton extends StatelessWidget {
  final NoteStatus noteStatus;
  const AddNoteButton({super.key, required this.noteStatus});
  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      openElevation: 10,
      closedElevation: 10,
      transitionDuration: const Duration(milliseconds: 300),
      openColor: context.theme.colorScheme.background,
      closedColor: context.theme.colorScheme.onSecondary,
      middleColor: context.theme.colorScheme.background,
      closedShape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      openBuilder: (_, action) {
        if (noteStatus == NoteStatus.labeled) {
          return BlocProvider.value(
            value: GetLabeledNotesCubit.of(context),
            child: AddNoteScreen(
                label: Label(name: GetLabeledNotesCubit.of(context).label),
                noteStatus:noteStatus),
          );
        }
        else{
          return AddNoteScreen(noteStatus:noteStatus);
        }
      },
      closedBuilder: (_, action) => AddNoteButtonBuilder(onTap: () {
        if (!AppBarCubit.of(context).isBase) {
          AppBarCubit.of(context).removeSelection();
        }
        action();
      }),
    );
  }
}
