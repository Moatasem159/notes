import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/app/injection_container.dart';
import 'package:notes/config/routes/app_routes.dart';
import 'package:notes/config/themes/app_theme.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes/cubits/search_cubit/search_cubit.dart';
import 'package:notes/models/label.dart';
import 'package:notes/models/note.dart';
import 'package:notes/widgets/add_note_screen/add_note_screen_appbar.dart';
import 'package:notes/widgets/add_note_screen/add_note_screen_body/add_note_screen_body.dart';
import 'package:notes/widgets/add_note_screen/bottom_bar/add_note_bottom_bar.dart';

class AddNoteScreen extends StatelessWidget {
  final Note? note;
  final Label? label;
  final NoteStatus? noteStatus;
  final bool isSearch;
  final bool notification;

  const AddNoteScreen(
      {super.key,
      this.note,
      this.noteStatus = NoteStatus.active,
      this.label,
      this.isSearch = false,
      this.notification=false});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AddNoteCubit(sl(),
          note: note, noteStatus: noteStatus, label: label, isSearch: isSearch),
      child: Builder(builder: (BuildContext context) {
        return BlocConsumer<AddNoteCubit, AddNoteStates>(
          listener: AddNoteCubit.of(context).listen,
          builder: (BuildContext context, AddNoteStates state) {
            AddNoteCubit cubit = AddNoteCubit.of(context);
            return AnnotatedRegion<SystemUiOverlayStyle>(
              value: AppTheme.systemUiOverlayStyle(context).copyWith(
                  statusBarColor: cubit.note!.color == Colors.transparent.value
                      ? context.scaffoldBackground
                      : Color(cubit.note!.color),
                  systemNavigationBarColor:
                      cubit.note!.color == Colors.transparent.value
                          ? context.scaffoldBackground
                          : Color(cubit.note!.color)),
              child: PopScope(
                canPop: !notification,
                onPopInvoked: (canPop) {
                  if(canPop){
                    if (note == null) {
                      cubit.addNote();
                    }
                    else if (note!.status != NoteStatus.deleted) {
                      cubit.editNote();
                    }
                    if (isSearch) {
                      SearchCubit.of(context).search(edit: true);
                    }
                  }
                  if(notification)
                    {
                      AppRouter.navigatorKey.currentState!.pushReplacementNamed(Routes.homeRoute);
                    }
                },
                child: SafeArea(
                  child: Scaffold(
                    backgroundColor:
                        cubit.note!.color == Colors.transparent.value
                            ? context.scaffoldBackground
                            : Color(cubit.note!.color),
                    appBar:
                        AddNoteScreenAppbar(note: note, noteStatus: noteStatus,notification: notification),
                    body: GestureDetector(
                      onTap: () => cubit.absorb(context),
                      child: AbsorbPointer(
                        absorbing: !cubit.restored,
                        child: const AddNoteScreenBody(),
                      ),
                    ),
                    bottomNavigationBar: GestureDetector(
                      onTap: () => cubit.absorb(context),
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
      }),
    );
  }
}
