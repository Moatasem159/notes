import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:notes/config/themes/app_theme.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes/models/note.dart';
import 'package:notes/widgets/add_note_screen/add_note_screen_appbar.dart';
import 'package:notes/widgets/add_note_screen/add_note_screen_body/add_note_screen_body.dart';
import 'package:notes/widgets/add_note_screen/bottom_bar/add_note_bottom_bar.dart';

class AddNoteScreen extends StatelessWidget {
  final Note? note;

  const AddNoteScreen({super.key, this.note});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AddNoteCubit(note: note),
      child: BlocConsumer<AddNoteCubit, AddNoteStates>(
        listener: (context, state){},
        builder: (context, state) {
          AddNoteCubit cubit =AddNoteCubit.of(context);
          return AnnotatedRegion<SystemUiOverlayStyle>(
            value: AppTheme.systemUiOverlayStyle().copyWith(
                statusBarColor: cubit.note!.color == Colors.transparent.value
                  ?context.scaffoldBackground
                  : Color(cubit.note!.color),
              systemNavigationBarColor:
              cubit.note!.color == Colors.transparent.value
                  ? context.scaffoldBackground
                  : Color(cubit.note!.color)),
            child: PopScope(
              child: SafeArea(
                child: Scaffold(
                  backgroundColor:cubit.note!.color == Colors.transparent.value ? context.scaffoldBackground:Color(cubit.note!.color),
                  appBar: AddNoteScreenAppbar(arrowBack: (){
                    context.pop();
                  }),
                  body: const AddNoteScreenBody(),
                  bottomNavigationBar: const AddNoteBottomNavBar()
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
