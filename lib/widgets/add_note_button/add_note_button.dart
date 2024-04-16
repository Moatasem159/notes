import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/cubits/app_bar_cubit/app_bar_cubit.dart';
import 'package:notes/cubits/get_active_notes_cubit/get_active_notes_cubit.dart';
import 'package:notes/cubits/get_labeled_notes_cubit/get_labeled_notes_cubit.dart';
import 'package:notes/models/note.dart';
import 'package:notes/screens/add_note_screen.dart';
part 'add_note_button_builder.dart';
part 'add_icon_painter.dart';
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
      closedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      openBuilder: (_, action) {
        if (noteStatus == NoteStatus.active) {
          return BlocProvider.value(
            value: GetActiveNotesCubit.of(context),
            child: AddNoteScreen(noteStatus: noteStatus),
          );
        }
        else if (noteStatus == NoteStatus.labeled) {
          return BlocProvider.value(
            value: GetLabeledNotesCubit.of(context),
            child: AddNoteScreen(
                label: GetLabeledNotesCubit.of(context).label,
                noteStatus: noteStatus),
          );
        }
        else {
          return AddNoteScreen(noteStatus: noteStatus);
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
