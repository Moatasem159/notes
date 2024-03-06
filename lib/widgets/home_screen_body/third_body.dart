part of'home_screen_body.dart';
class _ThirdBody extends StatelessWidget {
  final List<Note> pinnedNotes;
  const _ThirdBody({required this.pinnedNotes});
  @override
  Widget build(BuildContext context) {
    return CustomScrollList(
      slivers: [
        const HomeAppBar(),
        SliverPadding(
          padding: const EdgeInsets.symmetric(vertical: 7),
          sliver: ListTitle(title: context.local.pinned),
        ),
        NotesList(notes:pinnedNotes),
      ],
    );
  }
}