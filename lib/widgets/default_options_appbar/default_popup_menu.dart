part of'default_options_appbar.dart';
class _DefaultPopupMenu extends StatelessWidget {
  final NoteStatus noteStatus;
  const _DefaultPopupMenu(this.noteStatus);
  @override
  Widget build(BuildContext context) {
    return BlocListener<NotesActionsBloc, NotesActionsState>(
      listener: (context, state) {
        if (state is ActionSuccessState && noteStatus == NoteStatus.active) {
          AppBarCubit.of(context).removeSelection();
          GetActiveNotesCubit.of(context).getNotes();
        }
        if (state is ActionSuccessState && noteStatus == NoteStatus.archive) {
          AppBarCubit.of(context).removeSelection();
          GetArchivedNotesCubit.of(context).getArchivedNotes();
          GetActiveNotesCubit.of(context).getNotes();
        }
        if (state is ActionSuccessState && noteStatus == NoteStatus.deleted) {
          AppBarCubit.of(context).removeSelection();
          GetDeletedNotesCubit.of(context).getDeletedNotes();
        }
      },
      child: CustomPopupMenu(items: [
        PopupMenuItem(
          onTap: () => NotesActionsBloc.of(context).add(ArchiveNote(AppBarCubit.of(context).selectedNotes,noteStatus == NoteStatus.active ? true : false)),
          child: CustomPopUpMenuItem(
              title: noteStatus == NoteStatus.active
                  ? context.local.archive
                  : context.local.unArchive),
        ),
        PopupMenuItem(
          onTap: () =>
              NotesActionsBloc.of(context).add(DeleteNote(AppBarCubit
                  .of(context)
                  .selectedNotes, true)),
          child: CustomPopUpMenuItem(title: context.local.delete),
        ),
      ]),
    );
  }
}