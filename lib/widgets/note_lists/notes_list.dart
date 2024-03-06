import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubits/switch_list_view_cubit/change_list_view_cubit.dart';
import 'package:notes/models/note.dart';
import 'package:notes/widgets/note_lists/note_grid_list.dart';
import 'package:notes/widgets/note_lists/note_normal_list.dart';
class NotesList extends StatelessWidget {
  final List<Note> notes;
  const NotesList({super.key, required this.notes});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SwitchListViewCubit, ListViewType>(
      builder: (context, state) {
        if (state == ListViewType.grid) {
          return NoteGridList(notes: notes);
        } else {
          return NoteNormalList(notes: notes);
        }
      },
    );
  }
}