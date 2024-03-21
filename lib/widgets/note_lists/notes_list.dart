import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/widgets/note_lists/note_grid_list.dart';
import 'package:notes/widgets/note_lists/note_normal_list.dart';
import 'package:notes/cubits/switch_list_view_cubit/change_list_view_cubit.dart';
class NotesList extends StatelessWidget {
  final int length;
  final Widget Function(BuildContext context, int index) itemBuilder;
  const NotesList({super.key, required this.length, required this.itemBuilder});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SwitchListViewCubit, ListViewType>(
        builder: (_, state) => state == ListViewType.grid
            ? NoteGridList(length: length, itemBuilder: itemBuilder)
            : NoteNormalList(length: length, itemBuilder: itemBuilder));
  }
}