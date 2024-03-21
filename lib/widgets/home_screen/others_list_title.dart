part of 'home_screen_body.dart';
class _OthersListTitle extends StatelessWidget {
  const _OthersListTitle();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetActiveNotesCubit, GetActiveNotesStates>(
      builder: (context, state) {
        (bool, bool) check = GetActiveNotesCubit.of(context).notes.listHasPinnedNotes();
        if (check.$1 && check.$2) {
          return ListTitle(title: context.local.others);
        }
        return const SliverToBoxAdapter();
      },
    );
  }
}