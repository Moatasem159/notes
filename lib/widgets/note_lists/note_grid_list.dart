import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:notes/models/note.dart';
import 'package:notes/widgets/note_widget/note_widget.dart';
class NoteGridList extends StatelessWidget {
  final List<Note> notes;
  const NoteGridList({super.key, required this.notes});
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: MasonryGridView.builder(
        itemCount: notes.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) => NoteWidget(isGrid: true, note: notes[index]),
      ),
    );
  }
}