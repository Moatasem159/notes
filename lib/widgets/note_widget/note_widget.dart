import 'dart:io';
import 'package:flutter/material.dart';
import 'package:notes/cubits/app_bar_cubit/app_bar_cubit.dart';
import 'package:notes/cubits/get_active_notes_cubit/get_active_notes_cubit.dart';
import 'package:notes/cubits/get_archived_notes_cubit/get_archived_notes_cubit.dart';
import 'package:notes/cubits/get_deleted_notes_cubit/get_deleted_notes_cubit.dart';
import 'package:notes/cubits/get_labeled_notes_cubit/get_labeled_notes_cubit.dart';
import 'package:notes/cubits/search_cubit/search_cubit.dart';
import 'package:notes/models/label.dart';
import 'package:notes/models/note.dart';
import 'package:animations/animations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/screens/add_note_screen.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/core/extension/empty_padding_extension.dart';
import 'package:notes/widgets/label_widget.dart';
import 'package:notes/widgets/reminder_widget.dart';
import 'package:notes/widgets/toast/custom_toast.dart';
part 'note_content.dart';
part 'note_label_list.dart';
part 'note_builder.dart';
part 'note_closed_builder.dart';

class NoteWidget extends StatefulWidget {
  final Note note;
  final NoteStatus noteStatus;
  final bool isSearch;
  const NoteWidget({super.key,required this.note,required this.noteStatus,this.isSearch=false});

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
        key: ValueKey(widget.note.key),
        onDismissed: (direction) async {
          widget.note.status = NoteStatus.archive;
          widget.note.pinned = false;
          widget.note.save();
          CustomToast.showToast(context, msg: context.local.noteArchived);
          GetActiveNotesCubit.of(context).remove(widget.note);
        },
        confirmDismiss: (direction) async {
          if (widget.noteStatus == NoteStatus.active&&AppBarCubit.of(context).isBase&&!widget.isSearch) {
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
        child: _NoteBuilder(widget.note,widget.noteStatus,widget.isSearch),
      ),
    );
  }
}