import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/config/routes/app_routes.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes/cubits/search_cubit/search_cubit.dart';
import 'package:notes/models/note.dart';
import 'package:notes/widgets/add_note_screen/label_button.dart';
import 'package:notes/widgets/add_note_screen/reminder_button.dart';
import 'package:notes/widgets/custom_icon_button.dart';
class AddNoteScreenAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Note? note;
  final NoteStatus? noteStatus;
  final bool notification;
  const AddNoteScreenAppbar({super.key, this.note, this.noteStatus, required this.notification});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddNoteCubit, AddNoteStates>(
      builder: (context, state) {
        AddNoteCubit cubit = AddNoteCubit.of(context);
        return AppBar(
          backgroundColor: cubit.note!.color == Colors.transparent.value
              ? context.scaffoldBackground
              : Color(cubit.note!.color),
          leading: CustomIconButton(onTap:(){
           if(!notification)
             {
               if(AddNoteCubit.of(context).isSearch)
               {
                 SearchCubit.of(context).search(edit: true);
               }
               context.pop();
             }
           else{
             AppRouter.navigatorKey.currentState!.pushReplacementNamed(Routes.homeRoute);
           }
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
              const LabelsButton(),
              const ReminderButton(),
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

