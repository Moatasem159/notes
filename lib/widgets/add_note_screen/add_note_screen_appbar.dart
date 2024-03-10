import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:notes/config/routes/app_routes.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes/models/label.dart';
import 'package:notes/models/note.dart';
import 'package:notes/models/pick_label_params.dart';
import 'package:notes/widgets/custom_icon_button.dart';

class AddNoteScreenAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  final Note? note;
  final NoteStatus? noteStatus;

  const AddNoteScreenAppbar({super.key, this.note, this.noteStatus});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddNoteCubit, AddNoteStates>(
      builder: (context, state) {
        AddNoteCubit cubit = AddNoteCubit.of(context);
        return AppBar(
          backgroundColor: cubit.note!.color == Colors.transparent.value
              ? context.scaffoldBackground
              : Color(cubit.note!.color),
          leading: CustomIconButton(
              onTap: () {
                if (note == null) {
                  AddNoteCubit.of(context).addNote();
                } else {
                  AddNoteCubit.of(context).editNote();
                }
                context.pop();
              },
              icon: const Icon(Icons.arrow_back_outlined)),
          actions: [
            if ((noteStatus != NoteStatus.deleted) ||
                (noteStatus == NoteStatus.deleted &&
                    cubit.restored == true)) ...[
              CustomIconButton(
                  tooltip: context.local.delete,
                  onTap: cubit.deleteNote,
                  icon: const Icon(Icons.delete_outline_rounded)),
              CustomIconButton(
                onTap: cubit.changePinNote,
                icon: Icon(cubit.note!.pinned
                    ? Icons.push_pin_rounded
                    : Icons.push_pin_outlined),
                tooltip: context.local.pin,
              ),
              CustomIconButton(
                  onTap: () {
                    List<Label> labels=[];
                    List<Note> notes=[];
                    for (Label element in cubit.note!.labels) {
                      element.checkType=CheckType.all;
                    }
                    labels.addAll(cubit.note!.labels);
                    notes.add(cubit.note!);
                    PickLabelParams params=PickLabelParams(notes: notes, labels: labels);
                    context.pushNamed(Routes.pickLabelRoute,extra: params);
                  },
                  icon: const Icon(Icons.label_outline_rounded)),
              CustomIconButton(
                onTap: () {},
                icon: const Icon(Icons.notification_add_outlined),
                tooltip: context.local.reminder,
              ),
              CustomIconButton(
                onTap: cubit.changeArchiveNote,
                icon: Icon(cubit.note!.status == NoteStatus.archive
                    ? Icons.unarchive_outlined
                    : Icons.archive_outlined),
                tooltip: context.local.archive,
              ),
            ],
            if (noteStatus == NoteStatus.deleted) ...[
              if (cubit.restored == false)
                CustomIconButton(
                    tooltip: context.local.restore,
                    onTap: cubit.restoreNote,
                    icon: const Icon(Icons.restore)),
              CustomIconButton(
                  tooltip: context.local.delete,
                  onTap: cubit.deleteForever,
                  icon: const Icon(Icons.delete_forever)),
            ]
          ],
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 60);
}
