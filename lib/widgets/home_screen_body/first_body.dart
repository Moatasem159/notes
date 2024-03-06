part of'home_screen_body.dart';
class _FirstBody extends StatelessWidget {
  final List<Note> notes;
  final List<Note> pinnedNotes;
  const _FirstBody({required this.notes, required this.pinnedNotes});
  @override
  Widget build(BuildContext context) {
    return CustomScrollList(
      slivers: [
        const HomeAppBar(),
        SliverPadding(
          padding: const EdgeInsets.symmetric(vertical: 7),
          sliver: ListTitle(title: context.local.pinned),
        ),
        NotesList(notes: pinnedNotes,noteStatus: NoteStatus.active),
        SliverPadding(
          padding: const EdgeInsets.symmetric(vertical: 7),
          sliver: ListTitle(title: context.local.others),
        ),
        NotesList(notes: notes,noteStatus: NoteStatus.active),
      ],
    );
  }
}