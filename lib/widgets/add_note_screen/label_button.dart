import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:notes/config/routes/app_routes.dart';
import 'package:notes/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes/cubits/get_archived_notes_cubit/get_archived_notes_cubit.dart';
import 'package:notes/models/label.dart';
import 'package:notes/models/note.dart';
import 'package:notes/models/pick_label_params.dart';
import 'package:notes/widgets/custom_icon_button.dart';
class LabelsButton extends StatelessWidget {
  final NoteStatus noteStatus;
  const LabelsButton({super.key,required this.noteStatus});
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
          PickLabelParams params;
          if (noteStatus == NoteStatus.archive) {
            Cubit cubit = GetArchivedNotesCubit.of(context);
            params = PickLabelParams(
                addNoteCubit: AddNoteCubit.of(context),
                notes: notes,
                labels: labels,
                notesCubit: cubit);
            context.pushNamed(Routes.pickLabelRoute,
                extra: params,
                queryParameters: {
                  "inNote": "true",
                  "noteStatus": noteStatus.toString(),
                });
          } else {
            params = PickLabelParams(
                notes: notes,
                labels: labels,
                addNoteCubit: AddNoteCubit.of(context));
            context.pushNamed(Routes.pickLabelRoute,
                extra: params,
                queryParameters: {
                  "inNote": "true",
                  "noteStatus": noteStatus.toString(),
                });
          }
        },
        icon: const Icon(Icons.label_outline_rounded));
  }
}