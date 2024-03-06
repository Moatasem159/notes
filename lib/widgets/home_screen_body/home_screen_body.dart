import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/cubits/get_active_notes_cubit/get_active_notes_cubit.dart';
import 'package:notes/models/note.dart';
import 'package:notes/widgets/custom_scroll_list.dart';
import 'package:notes/widgets/empty_body.dart';
import 'package:notes/widgets/home_screen_appbar/home_appbar.dart';
import 'package:notes/widgets/note_lists/list_title.dart';
import 'package:notes/widgets/note_lists/notes_list.dart';
part 'first_body.dart';
part 'second_body.dart';
part 'third_body.dart';
class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetActiveNotesCubit, GetActiveNotesStates>(
      builder: (context, state) {
        if (state is GetActiveNotesSuccessState && state.notes.isNotEmpty && state.pinnedNotes.isNotEmpty) {
          return _FirstBody(notes: state.notes,pinnedNotes: state.pinnedNotes);
        } else if (state is GetActiveNotesSuccessState && state.notes.isNotEmpty && state.pinnedNotes.isEmpty) {
          return _SecondBody(notes:state.notes);
        } else if (state is GetActiveNotesSuccessState && state.notes.isEmpty && state.pinnedNotes.isNotEmpty) {
          return _ThirdBody(pinnedNotes: state.pinnedNotes);
        }
        return CustomScrollList(
          slivers: [
            const HomeAppBar(),
            EmptyBody(title: context.local.homeBodyTitle,icon: Icons.lightbulb_outline_rounded)
          ],
        );
      },
    );
  }
}




