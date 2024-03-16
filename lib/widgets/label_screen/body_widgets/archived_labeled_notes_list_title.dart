part of'../label_screen_body.dart';
class _ArchivedLabeledNotesListTitle extends StatelessWidget {
  const _ArchivedLabeledNotesListTitle();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetLabeledNotesCubit, GetLabeledNotesStates>(
      builder: (context, state) {
        if (state is GetLabeledNotesSuccessState &&
            state.archivedNotes.isNotEmpty) {
          return ListTitle(title: context.local.archive);
        }
        return const SliverToBoxAdapter();
      },
    );
  }
}