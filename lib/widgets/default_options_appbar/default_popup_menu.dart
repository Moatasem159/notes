part of 'default_options_appbar.dart';
class _DefaultPopupMenu extends StatelessWidget {
  final NoteStatus noteStatus;
  const _DefaultPopupMenu(this.noteStatus);
  @override
  Widget build(BuildContext context) {
    return BlocListener<NotesActionsBloc, NotesActionsState>(
      listener: (context, state) {
        if (state is ArchiveSuccessState || state is DeleteSuccessState) {
          if (noteStatus == NoteStatus.labeled) {
            GetLabeledNotesCubit.of(context).getLabeledNotes();
          } else if (noteStatus == NoteStatus.active) {
            GetActiveNotesCubit.of(context).getNotes();
          } else if (noteStatus == NoteStatus.archive) {
            GetArchivedNotesCubit.of(context).getArchivedNotes();
          }
          AppBarCubit.of(context).removeSelection();
        }
      },
      child: CustomPopupMenu(
          items: [
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
