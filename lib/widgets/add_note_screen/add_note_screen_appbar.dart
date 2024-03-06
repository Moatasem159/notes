import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes/models/note.dart';
import 'package:notes/widgets/custom_icon_button.dart';
class AddNoteScreenAppbar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback arrowBack;
  const AddNoteScreenAppbar({super.key, required this.arrowBack});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddNoteCubit, AddNoteStates>(
      builder: (context, state) {
        return AppBar(backgroundColor: AddNoteCubit.of(context).note!.color == Colors.transparent.value ? context.scaffoldBackground
              : Color(AddNoteCubit.of(context).note!.color),
          leading:CustomIconButton(onTap: arrowBack, icon: Icons.arrow_back_outlined),
          actions: [
            CustomIconButton(
              onTap: AddNoteCubit.of(context).changePinNote,
              icon: AddNoteCubit.of(context).note!.pinned?Icons.push_pin_rounded:Icons.push_pin_outlined,
              tooltip: context.local.pin,
            ),
            CustomIconButton(
              onTap: () {},
              icon: Icons.notification_add_outlined,
              tooltip: context.local.reminder,
            ),
            CustomIconButton(
              onTap:  AddNoteCubit.of(context).changeArchiveNote,
              icon: AddNoteCubit.of(context).note!.status==NoteStatus.archive?Icons.unarchive_outlined:Icons.archive_outlined,
              tooltip: context.local.archive,
            ),
          ],
        );
      },
    );
  }
  @override
  Size get preferredSize => const Size(double.infinity, 60);
}
