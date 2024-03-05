import 'package:flutter/material.dart';
import 'package:notes/models/note.dart';
import 'package:notes/widgets/notes_counter.dart';
import 'package:notes/widgets/custom_icon_button.dart';
import 'package:notes/widgets/custom_popup_menu/custom_popup_menu.dart';
class DefaultOptionsAppBar extends StatelessWidget {
  final NoteStatus noteStatus;
  const DefaultOptionsAppBar({super.key, required this.noteStatus});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.only(top: noteStatus==NoteStatus.active?45:0),
      child: Row(
        children: [
          CustomIconButton(onTap:(){},icon: Icons.clear),
          const NotesCounter(),
          const Spacer(),
          CustomIconButton(onTap: (){},icon:Icons.push_pin_outlined),
          CustomIconButton(onTap: () {}, icon: Icons.notification_add_outlined),
          CustomIconButton(onTap: () {}, icon: Icons.color_lens_outlined),
          CustomIconButton(onTap: () {}, icon: Icons.label_outline_rounded),
          CustomPopUpMenu(noteStatus: noteStatus)
        ],
      ),
    );
  }
}