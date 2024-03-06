import 'package:flutter/material.dart';
import 'package:notes/models/note.dart';
import 'package:notes/widgets/note_widget/note_widget.dart';
class NoteNormalList extends StatelessWidget {
  final List<Note> notes;
  const NoteNormalList({super.key, required this.notes});
  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: notes.length,
      itemBuilder: (context, index) => NoteWidget(isGrid: false, note: notes[index],index: index)
    );
  }
}
