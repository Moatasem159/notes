import 'package:flutter/material.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/core/utils/app_text_styles.dart';
import 'package:notes/models/note.dart';
part 'custom_popup_menu_item.dart';
class CustomPopUpMenu extends StatelessWidget {
  final NoteStatus noteStatus;
  const CustomPopUpMenu({super.key, required this.noteStatus});
  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Colors.transparent,
      child:PopupMenuButton(
          clipBehavior: Clip.hardEdge,
          padding: EdgeInsets.zero,
          shape:RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)),
          splashRadius: 20,
          constraints: BoxConstraints(
              maxWidth: context.width / 1.894736842105263),
          itemBuilder: (_) {
            return [
              if(noteStatus!=NoteStatus.deleted)...[
                PopupMenuItem(
                  onTap: () {},
                  child: CustomPopUpMenuItem(title:noteStatus==NoteStatus.active?context.local.archive:context.local.unArchive),
                ),
                PopupMenuItem(
                  onTap: () {},
                  child: CustomPopUpMenuItem(title: context.local.delete),
                ),
              ],
              if(noteStatus==NoteStatus.deleted)
                PopupMenuItem(
                  onTap: () {},
                  child: CustomPopUpMenuItem(title:context.local.emptyBin),
                ),
                PopupMenuItem(
                  onTap: () {},
                  child: CustomPopUpMenuItem(title:context.local.deleteForEver),
                ),
            ];
          },
          icon: const Icon(Icons.more_vert_outlined)),
    );
  }
}