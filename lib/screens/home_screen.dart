import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/app/injection_container.dart';
import 'package:notes/config/themes/app_theme.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/cubits/get_active_notes_cubit/get_active_notes_cubit.dart';
import 'package:notes/widgets/add_note_button/add_note_button.dart';
import 'package:notes/widgets/custom_drawer/main_drawer.dart';
import 'package:notes/widgets/home_screen_body/home_screen_body.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GetActiveNotesCubit(sl())..getNotes()),
      ],
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: AppTheme.systemUiOverlayStyle(),
        child: Scaffold(
          backgroundColor: context.scaffoldBackground,
          drawer: const MainDrawer(),
          floatingActionButton: const AddNoteButton(),
          body: const HomeScreenBody(),
        ),
      ),
    );
  }
}