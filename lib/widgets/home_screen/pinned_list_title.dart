part of'home_screen_body.dart';
class _PinnedListTitle extends StatelessWidget {
  const _PinnedListTitle();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetActiveNotesCubit, GetActiveNotesStates>(
      builder: (context, state) {
        if (state is GetActiveNotesSuccessState &&
            state.pinnedNotes.isNotEmpty) {
          return ListTitle(title: context.local.pinned);
        }
        return const SliverToBoxAdapter();
      },
    );
  }
}