import 'dart:io';
import 'package:flutter/material.dart';
import 'package:notes/cubits/app_bar_cubit/app_bar_cubit.dart';
import 'package:notes/models/note.dart';
import 'package:animations/animations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/screens/add_note_screen.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/core/extension/empty_padding_extension.dart';
import 'package:notes/cubits/get_active_notes_cubit/get_active_notes_cubit.dart';
part 'note_content.dart';
part 'note_builder.dart';
part 'note_closed_builder.dart';
class NoteWidget extends StatefulWidget {
  final Note note;
  final bool isGrid;
  final int index;
  const NoteWidget({super.key,required this.isGrid,required this.note,required this.index});
  @override
  State<NoteWidget> createState() => _NoteWidgetState();
}
class _NoteWidgetState extends State<NoteWidget> {
  double opacity=1;
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: opacity,
      duration: const Duration(milliseconds: 50),
      child: Dismissible(
        key: ValueKey<int>(widget.index),
        behavior: HitTestBehavior.deferToChild,
        onUpdate: (details) {
          setState(() {
            opacity=1-details.progress;
          });
        },
        child: _NoteBuilder(widget.note, widget.isGrid),
      ),
    );
  }
}