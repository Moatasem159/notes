part of'../default_options_appbar.dart';
class _ColorButton extends StatelessWidget {
  final NoteStatus noteStatus;
  const _ColorButton(this.noteStatus);
  @override
  Widget build(BuildContext context) {
    return BlocListener<NotesActionsBloc, NotesActionsState>(
      listener: (context, state) {
        if (state is ColorSuccessState && (noteStatus == NoteStatus.active||noteStatus==NoteStatus.labeled)) {
          GetActiveNotesCubit.of(context).getNotes();
          if(noteStatus==NoteStatus.labeled)
          {
            GetLabeledNotesCubit.of(context).getLabeledNotes();
          }
          AppBarCubit.of(context).removeSelection();
        }
        if (state is ColorSuccessState && noteStatus == NoteStatus.archive) {
          GetArchivedNotesCubit.of(context).getArchivedNotes();
          AppBarCubit.of(context).removeSelection();
        }
      },
      child: CustomIconButton(
          onTap: () {
            showDialog(
                context: context,
                builder: (_) {
                  return BlocProvider.value(
                    value: NotesActionsBloc.of(context),
                    child: BlocProvider(
                      create: (context) => ColorsBottomSheetCubit(
                          value: AppBarCubit.of(context).colors.length == 1
                              ? AppBarCubit.of(context).colors[0]
                              : null),
                      child: _ColorDialog(noteStatus),
                    ),
                  );
                });
          },
          icon: const Icon(Icons.color_lens_outlined)),
    );
  }
}


