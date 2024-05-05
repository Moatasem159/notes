part of'search_screen_body.dart';
class _EmptySearch extends StatelessWidget {
  const _EmptySearch();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchStates>(
      builder: (context, state) {
        if (state is GetSearchSuccessState && state.notes.isEmpty && state.archivedNotes.isEmpty) {
          return EmptyBody(
            title: context.local.emptySearch,
            icon: Icons.search_outlined,
          );
        }
        return const SliverToBoxAdapter();
      },
    );
  }
}