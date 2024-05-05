part of'search_screen_body.dart';
class _SearchNormalNotesList extends StatelessWidget {
  const _SearchNormalNotesList();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchStates>(
      builder: (context, state) {
        if (state is GetSearchSuccessState && state.notes.isNotEmpty) {
          return NotesList(
              length: state.notes.length,
              itemBuilder: (context, index) => NoteWidget(note: state.notes[index],noteStatus: SearchCubit.of(context).noteStatus,isSearch: true));
        }
        return const SliverToBoxAdapter();
      },
    );
  }
}