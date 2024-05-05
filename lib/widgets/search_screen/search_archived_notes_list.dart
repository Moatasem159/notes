part of'search_screen_body.dart';
class _SearchArchivedNotesList extends StatelessWidget {
  const _SearchArchivedNotesList();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchStates>(
      builder: (context, state) {
        if (state is GetSearchSuccessState && state.archivedNotes.isNotEmpty) {
          return NotesList(
              length: state.archivedNotes.length,
              itemBuilder: (context, index) => NoteWidget(note: state.archivedNotes[index],noteStatus:SearchCubit.of(context).noteStatus,isSearch: true,));
        }
        return const SliverToBoxAdapter();
      },
    );
  }
}