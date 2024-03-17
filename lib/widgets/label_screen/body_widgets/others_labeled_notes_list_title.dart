part of'../label_screen_body.dart';
class _OthersLabeledNotesListTitle extends StatelessWidget {
  const _OthersLabeledNotesListTitle();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetLabeledNotesCubit, GetLabeledNotesStates>(
      builder: (context, state) {
        if (state is GetLabeledNotesSuccessState &&
            state.notes.isNotEmpty &&(
            state.pinnedNotes.isNotEmpty ||
            state.archivedNotes.isNotEmpty)) {
          return ListTitle(title: context.local.others);
        }
        return const SliverToBoxAdapter();
      },
    );
  }
}