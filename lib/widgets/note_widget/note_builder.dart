part of'note_widget.dart';
class _NoteBuilder extends StatelessWidget {
  final Note note;
  final bool isGrid;
  const _NoteBuilder(this.note, this.isGrid);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 8),
      child: OpenContainer(
        closedElevation: 5,
        openElevation: 10,
        openColor: context.scaffoldBackground,
        closedColor: Colors.transparent,
        middleColor: context.scaffoldBackground,
        closedShape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        openBuilder: (_, action) {
          if (note.status == NoteStatus.active) {
            return BlocProvider.value(
                value: GetActiveNotesCubit.of(context),
                child: AddNoteScreen(note: note));
          } else {
            return AddNoteScreen(note: note);
          }
        },
        closedBuilder: (_, action) =>
            _NoteClosedBuilder(note: note, isGrid: isGrid, onTap: action),
      ),
    );
  }
}