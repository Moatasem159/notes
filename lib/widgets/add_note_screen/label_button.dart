import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:notes/config/routes/app_routes.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes/cubits/get_active_notes_cubit/get_active_notes_cubit.dart';
import 'package:notes/cubits/get_archived_notes_cubit/get_archived_notes_cubit.dart';
import 'package:notes/cubits/get_labeled_notes_cubit/get_labeled_notes_cubit.dart';
import 'package:notes/models/label.dart';
import 'package:notes/models/note.dart';
import 'package:notes/models/pick_label_params.dart';
import 'package:notes/widgets/custom_icon_button.dart';
class LabelsButton extends StatelessWidget {
  const LabelsButton({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
        onTap: () {
          List<Label> labels = [];
          List<Note> notes = [];
          for (Label element in AddNoteCubit.of(context).note!.labels) {
            element.checkType = CheckType.all;
          }
          labels.addAll(AddNoteCubit.of(context).note!.labels);
          notes.add(AddNoteCubit.of(context).note!);
          NoteStatus noteStatus=AddNoteCubit.of(context).noteStatus!;
          Cubit ?notesCubit;
          if(noteStatus==NoteStatus.labeled) {
              notesCubit=GetLabeledNotesCubit.of(context);
            }
          else if(noteStatus==NoteStatus.archive){
            notesCubit=GetArchivedNotesCubit.of(context);
          }
          else{
            notesCubit=GetActiveNotesCubit.of(context);
          }
          PickLabelParams params = PickLabelParams(
            noteStatus: noteStatus,
            addNoteCubit: AddNoteCubit.of(context),
            notesCubit: notesCubit,
            notes: notes,
            labels: labels,
            inNote: true,
          );
          context.pushNamed(Routes.pickLabelRoute, arguments: params);
        },
        icon: const Icon(Icons.label_outline_rounded));
  }
}