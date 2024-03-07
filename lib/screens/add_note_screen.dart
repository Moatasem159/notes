import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:notes/app/injection_container.dart';
import 'package:notes/config/themes/app_theme.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes/cubits/get_active_notes_cubit/get_active_notes_cubit.dart';
import 'package:notes/cubits/get_archived_notes_cubit/get_archived_notes_cubit.dart';
import 'package:notes/cubits/get_deleted_notes_cubit/get_deleted_notes_cubit.dart';
import 'package:notes/models/note.dart';
import 'package:notes/widgets/add_note_screen/add_note_screen_appbar.dart';
import 'package:notes/widgets/add_note_screen/add_note_screen_body/add_note_screen_body.dart';
import 'package:notes/widgets/add_note_screen/bottom_bar/add_note_bottom_bar.dart';
import 'package:notes/widgets/toast/custom_toast.dart';

class AddNoteScreen extends StatelessWidget {
  final Note? note;
  final NoteStatus? noteStatus;

  const AddNoteScreen({super.key, this.note, this.noteStatus});

  _absorb(BuildContext context, cubit) {
    if (cubit.restored == false) {
      CustomToast.showToast(context, msg: context.local.canNotEdit);
    } else {
      null;
    }
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AddNoteCubit(sl(), note: note),
      child: BlocConsumer<AddNoteCubit, AddNoteStates>(
        listener: (context, state) {
          if (state is DeleteNoteState) {
            context.pop();
            if (noteStatus == NoteStatus.archive) {
              GetArchivedNotesCubit.of(context).getArchivedNotes(edit: true);
            } else {
              GetActiveNotesCubit.of(context).getNotes(edit: true);
            }
          }
          if (state is AddNoteSuccessState && state.isAdded) {
            GetActiveNotesCubit.of(context).getNotes();
          }
          if (state is RestoreNoteState) {
            CustomToast.showToast(context, msg: context.local.noteRestored);
          }
          if (state is EditNoteSuccessState &&
              noteStatus == NoteStatus.archive) {
            GetArchivedNotesCubit.of(context).getArchivedNotes(edit: true);
          }
          if (state is EditNoteSuccessState &&
              noteStatus == NoteStatus.deleted) {
            GetDeletedNotesCubit.of(context).getDeletedNotes(edit: true);
          }
          if (state is EditNoteSuccessState) {
            GetActiveNotesCubit.of(context).getNotes(edit: true);
          }
          if (state is DeleteNoteForeverState) {
            GetDeletedNotesCubit.of(context).getDeletedNotes(edit: true);
            context.pop();
          }
        },
        builder: (context, state) {
          AddNoteCubit cubit = AddNoteCubit.of(context);
          return AnnotatedRegion<SystemUiOverlayStyle>(
            value: AppTheme.systemUiOverlayStyle().copyWith(
                statusBarColor: cubit.note!.color == Colors.transparent.value
                    ? context.scaffoldBackground
                    : Color(cubit.note!.color),
                systemNavigationBarColor:
                    cubit.note!.color == Colors.transparent.value
                        ? context.scaffoldBackground
                        : Color(cubit.note!.color)),
            child: PopScope(
              canPop: true,
              onPopInvoked: (didPop) {
                if (note == null) {
                  AddNoteCubit.of(context).addNote();
                } else if (note!.status != NoteStatus.deleted) {
                  AddNoteCubit.of(context).editNote();
                }
              },
              child: SafeArea(
                child: Scaffold(
                  backgroundColor: cubit.note!.color == Colors.transparent.value
                      ? context.scaffoldBackground
                      : Color(cubit.note!.color),
                  appBar:AddNoteScreenAppbar(note: note,noteStatus: noteStatus),
                  body:GestureDetector(
                    onTap: () => _absorb(context, cubit),
                    child: AbsorbPointer(
                      absorbing: !cubit.restored,
                      child: const AddNoteScreenBody(),
                    ),
                  ),
                  bottomNavigationBar: GestureDetector(
                    onTap: () => _absorb(context, cubit),
                    child: AbsorbPointer(
                      absorbing: !cubit.restored,
                      child: const AddNoteBottomNavBar(),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
