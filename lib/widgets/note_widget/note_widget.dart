import 'dart:io';
import 'package:flutter/material.dart';
import 'package:notes/cubits/app_bar_cubit/app_bar_cubit.dart';
import 'package:notes/cubits/get_active_notes_cubit/get_active_notes_cubit.dart';
import 'package:notes/cubits/get_archived_notes_cubit/get_archived_notes_cubit.dart';
import 'package:notes/cubits/get_deleted_notes_cubit/get_deleted_notes_cubit.dart';
import 'package:notes/models/label.dart';
import 'package:notes/models/note.dart';
import 'package:animations/animations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/screens/add_note_screen.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/core/extension/empty_padding_extension.dart';
import 'package:notes/widgets/label_widget.dart';
import 'package:notes/widgets/toast/custom_toast.dart';
part 'note_content.dart';
part 'note_label_list.dart';
part 'note_builder.dart';
part 'note_closed_builder.dart';

class NoteWidget extends StatefulWidget {
  final Note note;
  final int index;
  final NoteStatus noteStatus;
  const NoteWidget(
      {super.key,
      required this.note,
      required this.index,
      required this.noteStatus});

  @override
  State<NoteWidget> createState() => _NoteWidgetState();
}

class _NoteWidgetState extends State<NoteWidget> {
  double opacity = 1;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: opacity,
      duration: const Duration(milliseconds: 50),
      child: Dismissible(
        key: ValueKey<String>("${widget.note.date}${widget.index}"),
        onDismissed: (direction) async {
          GetActiveNotesCubit.of(context).getNotes();
          CustomToast.showToast(context, msg: context.local.noteArchived);
        },
        confirmDismiss: (direction) async {
          if (widget.note.status == NoteStatus.active&&AppBarCubit.of(context).isBase) {
            widget.note.status = NoteStatus.archive;
            widget.note.pinned = false;
            await widget.note.save();
            return true;
          } else {
            return null;
          }
        },
        behavior: HitTestBehavior.deferToChild,
        onUpdate: (details) {
          setState(() {
            opacity = 1 - details.progress;
          });
        },
        child: _NoteBuilder(widget.note,widget.noteStatus),
      ),
    );
  }
}