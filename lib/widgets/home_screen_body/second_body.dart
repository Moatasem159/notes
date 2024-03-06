part of'home_screen_body.dart';
class _SecondBody extends StatelessWidget {
  final List<Note> notes;
  const _SecondBody({required this.notes});

  @override
  Widget build(BuildContext context) {
    return CustomScrollList(
      slivers: [
        const HomeAppBar(),
        NotesList(notes:notes),
      ],
    );
  }
}