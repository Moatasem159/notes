import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/app/injection_container.dart';
import 'package:notes/config/routes/app_routes.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/cubits/get_active_notes_cubit/get_active_notes_cubit.dart';
import 'package:notes/cubits/get_archived_notes_cubit/get_archived_notes_cubit.dart';
import 'package:notes/cubits/get_deleted_notes_cubit/get_deleted_notes_cubit.dart';
import 'package:notes/cubits/get_labeled_notes_cubit/get_labeled_notes_cubit.dart';
import 'package:notes/cubits/label_actions_bloc/label_actions_bloc.dart';
import 'package:notes/models/create_label_params.dart';
import 'package:notes/models/note.dart';
import 'package:notes/widgets/create_label_screen/create_label_screen_body.dart';

class CreateLabelScreen extends StatelessWidget {
  final CreateLabelParams params;

  const CreateLabelScreen({super.key, required this.params});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LabelActionsBloc(sl())..add(GetLabelsEvent()),
      child: Builder(builder: (context) {
        bool canPop=true;
        if(params.notesStatus == NoteStatus.labeled&&!LabelActionsBloc.of(context).checkFound(params.label!.name)){
          canPop=false;
        }
        return PopScope(
          canPop:canPop,
          onPopInvoked: (didPop) {
            if(!didPop)
              {
                context.pushReplacementNamed(Routes.homeRoute);
              }
            if (LabelActionsBloc.of(context).actionHappened) {
              if (params.notesStatus == NoteStatus.active) {
                GetActiveNotesCubit.of(context).getNotes();
              } else if (params.notesStatus == NoteStatus.archive) {
                GetArchivedNotesCubit.of(context).getArchivedNotes();
              } else if (params.notesStatus == NoteStatus.labeled) {
                if (LabelActionsBloc.of(context).checkFound(params.label!.name)) {
                  GetLabeledNotesCubit.of(context).getLabeledNotes();
                }
              } else if (params.notesStatus == NoteStatus.deleted) {
                GetDeletedNotesCubit.of(context).getDeletedNotes();
              }
            }
          },
          child: Scaffold(
            backgroundColor: context.scaffoldBackground,
            body: CreateLabelScreenBody(isNew: params.isNew),
          ),
        );
      }),
    );
  }
}
