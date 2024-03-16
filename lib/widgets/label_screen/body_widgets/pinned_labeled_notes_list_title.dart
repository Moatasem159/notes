part of'../label_screen_body.dart';
class _PinnedLabeledNotesListTitle extends StatelessWidget {
  const _PinnedLabeledNotesListTitle();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetLabeledNotesCubit, GetLabeledNotesStates>(
      builder: (context, state) {
        if (state is GetLabeledNotesSuccessState &&
            state.pinnedNotes.isNotEmpty) {
          return ListTitle(title: context.local.pinned);
        }
        return const SliverToBoxAdapter();
      },
    );
  }
}