part of'home_screen_body.dart';
class _OthersListTitle extends StatelessWidget {
  const _OthersListTitle();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetActiveNotesCubit, GetActiveNotesStates>(
      builder: (context, state) {
        if (state is GetActiveNotesSuccessState &&
            state.notes.isNotEmpty &&
            state.pinnedNotes.isNotEmpty) {
          return ListTitle(title: context.local.others);
        }
        return const SliverToBoxAdapter();
      },
    );
  }
}