part of 'deleted_appbar.dart';
class _DeletedOptionsAppBar extends StatelessWidget {
  const _DeletedOptionsAppBar();
  @override
  Widget build(BuildContext context) {
    return BlocListener<NotesActionsBloc, NotesActionsState>(
      listener: (context, state) {
        if (state is ActionSuccessState) {
          AppBarCubit.of(context).removeSelection();
          GetDeletedNotesCubit.of(context).getDeletedNotes();
          GetActiveNotesCubit.of(context).getNotes();
        }
      },
      child: Row(
        children: [
          CustomIconButton(
              onTap: AppBarCubit.of(context).removeSelection,
              icon: Icons.clear),
          const NotesCounter(),
          const Spacer(),
          CustomIconButton(
              onTap: () => NotesActionsBloc.of(context).add(
                  DeleteNote(AppBarCubit.of(context).selectedNotes, false)),
              icon: Icons.restore),
          const CustomPopUpMenu(noteStatus: NoteStatus.deleted)
        ],
      ),
    );
  }
}
