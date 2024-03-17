import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/app/injection_container.dart';
import 'package:notes/config/themes/app_theme.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes/models/label.dart';
import 'package:notes/models/note.dart';
import 'package:notes/widgets/add_note_screen/add_note_screen_appbar.dart';
import 'package:notes/widgets/add_note_screen/add_note_screen_body/add_note_screen_body.dart';
import 'package:notes/widgets/add_note_screen/bottom_bar/add_note_bottom_bar.dart';
import 'package:notes/widgets/toast/custom_toast.dart';
class AddNoteScreen extends StatelessWidget {
  final Note? note;
  final Label? label;
  final NoteStatus? noteStatus;
  const AddNoteScreen({super.key, this.note, this.noteStatus=NoteStatus.active, this.label});

  _absorb(BuildContext context, AddNoteCubit cubit) {
    if (cubit.restored == false) {
      CustomToast.showToast(context, msg: context.local.canNotEdit);
    } else {
      null;
    }
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AddNoteCubit(sl(), note: note,noteStatus: noteStatus,label: label),
      child: Builder(
        builder: (BuildContext context) {
          return BlocConsumer<AddNoteCubit, AddNoteStates>(
            listener: AddNoteCubit.of(context).listen,
            builder:(BuildContext context,AddNoteStates state) {
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
                  onPopInvoked: (_) {
                    if (note == null) {
                      cubit.addNote();
                    } else if (note!.status != NoteStatus.deleted) {
                      cubit.editNote();
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
          );
        }
      ),
    );
  }
}