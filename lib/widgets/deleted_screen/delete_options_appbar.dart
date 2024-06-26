part of 'deleted_screen_body.dart';
class _DeletedOptionsAppBar extends StatelessWidget {
  const _DeletedOptionsAppBar();
  @override
  Widget build(BuildContext context) {
    return BlocListener<NotesActionsBloc, NotesActionsState>(
      listener: (context, state) {
        if (state is DeleteSuccessState) {
          AppBarCubit.of(context).removeSelection();
          GetDeletedNotesCubit.of(context).getDeletedNotes();
        }
      },
      child: Row(
        children: [
          CustomIconButton(
              onTap: AppBarCubit.of(context).removeSelection,
              icon: const Icon(Icons.clear)),
          const NotesCounter(),
          const Spacer(),
          CustomIconButton(
              onTap: () => NotesActionsBloc.of(context).add(
                  DeleteNote(AppBarCubit.of(context).selectedNotes, false)),
              icon: const Icon(Icons.restore)),
          const _DeletePopUpMenu()
        ],
      ),
    );
  }
}
