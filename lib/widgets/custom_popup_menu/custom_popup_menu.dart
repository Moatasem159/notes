import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/core/utils/app_text_styles.dart';
import 'package:notes/cubits/app_bar_cubit/app_bar_cubit.dart';
import 'package:notes/cubits/get_active_notes_cubit/get_active_notes_cubit.dart';
import 'package:notes/cubits/get_archived_notes_cubit/get_archived_notes_cubit.dart';
import 'package:notes/cubits/get_deleted_notes_cubit/get_deleted_notes_cubit.dart';
import 'package:notes/cubits/notes_actions_bloc/notes_actions_bloc.dart';
import 'package:notes/models/note.dart';
part 'custom_popup_menu_item.dart';
class CustomPopUpMenu extends StatelessWidget {
  final NoteStatus noteStatus;
  const CustomPopUpMenu({super.key, required this.noteStatus});
  @override
  Widget build(BuildContext context) {
    return BlocListener<NotesActionsBloc, NotesActionsState>(
      listener: (context, state) {
        if (state is ActionSuccessState && noteStatus==NoteStatus.active) {
          AppBarCubit.of(context).removeSelection();
          GetActiveNotesCubit.of(context).getNotes();
        }
        if (state is ActionSuccessState && noteStatus==NoteStatus.archive) {
          AppBarCubit.of(context).removeSelection();
          GetArchivedNotesCubit.of(context).getArchivedNotes();
          GetActiveNotesCubit.of(context).getNotes();
        }
        if (state is ActionSuccessState && noteStatus==NoteStatus.deleted) {
          AppBarCubit.of(context).removeSelection();
          GetDeletedNotesCubit.of(context).getDeletedNotes();
        }
      },
      child: Material(
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Colors.transparent,
        child: PopupMenuButton(
            clipBehavior: Clip.hardEdge,
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)),
            splashRadius: 20,
            constraints:
            BoxConstraints(maxWidth: context.width / 1.894736842105263),
            itemBuilder: (_) {
              return [
                if (noteStatus != NoteStatus.deleted) ...[
                  PopupMenuItem(
                    onTap: () => NotesActionsBloc.of(context).add(
                        ArchiveNote(
                            AppBarCubit.of(context).selectedNotes,
                            noteStatus == NoteStatus.active
                                ? true
                                : false)),
                    child: CustomPopUpMenuItem(
                        title: noteStatus == NoteStatus.active
                            ? context.local.archive
                            : context.local.unArchive),
                  ),
                  PopupMenuItem(
                    onTap: () =>NotesActionsBloc.of(context).add(DeleteNote(AppBarCubit.of(context).selectedNotes, true)),
                    child: CustomPopUpMenuItem(title: context.local.delete),
                  ),
                ],
                if (noteStatus == NoteStatus.deleted)
                  if (AppBarCubit.of(context).isBase)
                   PopupMenuItem(
                      onTap:() => NotesActionsBloc.of(context).add(EmptyBin()),
                      child: CustomPopUpMenuItem(title: context.local.emptyBin),
                    ),
                if (noteStatus == NoteStatus.deleted&&!AppBarCubit.of(context).isBase)
                   PopupMenuItem(
                     onTap: () =>NotesActionsBloc.of(context).add(DeleteForever(AppBarCubit.of(context).selectedNotes)),
                     child:CustomPopUpMenuItem(title: context.local.deleteForEver),
                  ),
              ];
            },
            icon: const Icon(Icons.more_vert_outlined)),
      ),
    );
  }
}
