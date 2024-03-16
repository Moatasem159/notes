part of 'default_options_appbar.dart';

class _DefaultPopupMenu extends StatelessWidget {
  final NoteStatus noteStatus;

  const _DefaultPopupMenu(this.noteStatus);

  @override
  Widget build(BuildContext context) {
    return BlocListener<NotesActionsBloc, NotesActionsState>(
      listener: (context, state) {
        if ((state is ArchiveSuccessState || state is DeleteSuccessState) &&
            (noteStatus == NoteStatus.active ||
                noteStatus == NoteStatus.labeled)) {
          AppBarCubit.of(context).removeSelection();
          if (noteStatus == NoteStatus.labeled) {
            GetLabeledNotesCubit.of(context).getLabeledNotes();
          }
          GetActiveNotesCubit.of(context).getNotes();
        }
        if ((state is ArchiveSuccessState || state is DeleteSuccessState) &&
            noteStatus == NoteStatus.archive) {
          AppBarCubit.of(context).removeSelection();
          GetArchivedNotesCubit.of(context).getArchivedNotes();
          GetActiveNotesCubit.of(context).getNotes();
        }
      },
      child: CustomPopupMenu(items: [
        PopupMenuItem(
          onTap: () => NotesActionsBloc.of(context).add(ArchiveNote(
              AppBarCubit.of(context).selectedNotes,
              !AppBarCubit.of(context).isArchived)),
          child: BlocBuilder<AppBarCubit, AppBarStates>(
            builder: (context, state) {
              return CustomPopUpMenuItem(
                  title: AppBarCubit.of(context).isArchived
                      ? context.local.unArchive
                      : context.local.archive);
            },
          ),
        ),
        PopupMenuItem(
          onTap: () => NotesActionsBloc.of(context)
              .add(DeleteNote(AppBarCubit.of(context).selectedNotes, true)),
          child: CustomPopUpMenuItem(title: context.local.delete),
        ),
      ]),
    );
  }
}
