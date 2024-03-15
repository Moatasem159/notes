part of'home_screen_body.dart';
class _EmptyNotes extends StatelessWidget {
  const _EmptyNotes();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetActiveNotesCubit, GetActiveNotesStates>(
      builder: (context, state) {
        if (state is GetActiveNotesSuccessState &&
            state.notes.isEmpty &&
            state.pinnedNotes.isEmpty) {
          return EmptyBody(
              title: context.local.homeBodyTitle,
              icon: Icons.lightbulb_outline_rounded);
        }
        return const SliverToBoxAdapter();
      },
    );
  }
}