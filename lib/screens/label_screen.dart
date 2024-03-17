import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/app/injection_container.dart';
import 'package:notes/config/themes/app_theme.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/cubits/app_bar_cubit/app_bar_cubit.dart';
import 'package:notes/cubits/get_labeled_notes_cubit/get_labeled_notes_cubit.dart';
import 'package:notes/models/note.dart';
import 'package:notes/widgets/add_note_button/add_note_button.dart';
import 'package:notes/widgets/custom_drawer/main_drawer.dart';
import 'package:notes/widgets/label_screen/label_screen_body.dart';
class LabelScreen extends StatelessWidget {
  final String title;
  const LabelScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => GetLabeledNotesCubit(sl(), title)..getLabeledNotes(),
        child: BlocBuilder<AppBarCubit, AppBarStates>(
          builder: (context, state) {
            return AnnotatedRegion<SystemUiOverlayStyle>(
              value: AppTheme.systemUiOverlayStyle().copyWith(
                  statusBarColor: AppBarCubit.of(context).isBase
                      ? context.scaffoldBackground
                      : context.theme.colorScheme.onSecondary),
              child: SafeArea(
                child: Scaffold(
                  resizeToAvoidBottomInset:false,
                  backgroundColor: context.scaffoldBackground,
                  drawer: const MainDrawer(),
                  body: const LabelScreenBody(),
                  floatingActionButton: const AddNoteButton(noteStatus: NoteStatus.labeled),
                ),
              ),
            );
          },
        ),
      );
  }
}


