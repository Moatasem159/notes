import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/config/routes/app_routes.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/core/utils/app_text_styles.dart';
import 'package:notes/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes/cubits/get_active_notes_cubit/get_active_notes_cubit.dart';
import 'package:notes/cubits/get_archived_notes_cubit/get_archived_notes_cubit.dart';
import 'package:notes/cubits/get_labeled_notes_cubit/get_labeled_notes_cubit.dart';
import 'package:notes/models/label.dart';
import 'package:notes/models/note.dart';
import 'package:notes/models/pick_label_params.dart';
class LabelWidget extends StatelessWidget {
  final Label ?label;
  final bool tapped;
  final int count;
  const LabelWidget({super.key, required this.label, required this.tapped,this.count=0});
  @override
  Widget build(BuildContext context) {
    return  tapped?GestureDetector(
      onTap:() {
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
      child: _Label(label: label, count: count),
    ): _Label(label: label, count: count);
  }
}

class _Label extends StatelessWidget {
  final Label? label;
  final int count;
  const _Label({required this.label, required this.count});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.4),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(label?.name??"+${count.toString()}", style: AppStyles.styleRegular16(context)),
    );
  }
}