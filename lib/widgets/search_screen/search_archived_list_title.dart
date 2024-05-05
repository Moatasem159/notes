part of'search_screen_body.dart';
class _SearchArchivedListTitle extends StatelessWidget {
  const _SearchArchivedListTitle();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchStates>(
      builder: (context, state) {
        if (state is GetSearchSuccessState && state.archivedNotes.isNotEmpty) {
          return ListTitle(title: context.local.archive);
        }
        return const SliverToBoxAdapter();
      },
    );
  }
}