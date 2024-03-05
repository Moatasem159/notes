import 'package:flutter/material.dart';
import 'package:notes/models/note.dart';
import 'package:notes/widgets/note_widget/note_widget.dart';
class NoteNormalList extends StatelessWidget {
  const NoteNormalList({super.key});
  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 50,
      itemBuilder: (context, index) =>
          NoteWidget(isGrid: false, note: Note(date: "date", color: 00000000)),
    );
  }
}