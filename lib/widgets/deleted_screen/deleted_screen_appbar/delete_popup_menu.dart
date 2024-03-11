part of'deleted_appbar.dart';
class DeletePopUpMenu extends StatelessWidget {
  final NoteStatus noteStatus;
  const DeletePopUpMenu({super.key, required this.noteStatus});
  @override
  Widget build(BuildContext context) {
    return BlocListener<NotesActionsBloc, NotesActionsState>(
        listener: (context, state) {
          if (state is DeleteSuccessState) {
            AppBarCubit.of(context).removeSelection();
            GetDeletedNotesCubit.of(context).getDeletedNotes();
          }
        },
        child: CustomPopupMenu(items: [
          if (noteStatus == NoteStatus.deleted)
            if (AppBarCubit.of(context).isBase)
              PopupMenuItem(
                onTap: () => NotesActionsBloc.of(context).add(EmptyBin()),
                child: CustomPopUpMenuItem(title: context.local.emptyBin),
              ),
          if (noteStatus == NoteStatus.deleted && !AppBarCubit.of(context).isBase)
            PopupMenuItem(
              onTap: () =>
                  NotesActionsBloc.of(context).add(DeleteForever(AppBarCubit
                      .of(context)
                      .selectedNotes)),
              child: CustomPopUpMenuItem(title: context.local.deleteForEver),
            ),
        ])
    );
  }
}




