part of 'deleted_screen_body.dart';
class _DeletePopUpMenu extends StatelessWidget {
  const _DeletePopUpMenu();
  @override
  Widget build(BuildContext context) {
    return BlocListener<NotesActionsBloc, NotesActionsState>(
      listener: (context, state) {
        if (state is DeleteSuccessState) {
          AppBarCubit.of(context).removeSelection();
          GetDeletedNotesCubit.of(context).getDeletedNotes();
        }
      },
      child: CustomPopupMenu(
        items: [
          PopupMenuItem(
            onTap: () => AppBarCubit.of(context).isBase
                ? NotesActionsBloc.of(context).add(EmptyBin())
                : NotesActionsBloc.of(context).add(
                    DeleteForever(AppBarCubit.of(context).selectedNotes),
                  ),
            child: CustomPopUpMenuItem(
              title: AppBarCubit.of(context).isBase
                  ? context.local.emptyBin
                  : context.local.deleteForEver,
            ),
          ),
        ],
      ),
    );
  }
}