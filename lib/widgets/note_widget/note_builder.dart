part of'note_widget.dart';
class _NoteBuilder extends StatelessWidget {
  final Note note;
  final bool isGrid;
  final NoteStatus noteStatus;
  const _NoteBuilder(this.note, this.isGrid, this.noteStatus);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 8),
      child: OpenContainer(
        closedElevation: 0,
        openElevation: 0,
        openColor: context.scaffoldBackground,
        closedColor: Colors.transparent,
        middleColor: context.scaffoldBackground,
        closedShape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        openBuilder: (_, action) {
          if(noteStatus ==NoteStatus.active)
            {
              return BlocProvider.value(
                  value: GetActiveNotesCubit.of(context),
                  child: AddNoteScreen(note: note,noteStatus: noteStatus));
            }
          else if (noteStatus== NoteStatus.archive) {
            return BlocProvider.value(
                value: GetArchivedNotesCubit.of(context),
                child: AddNoteScreen(note: note,noteStatus: noteStatus));
          } else if (noteStatus== NoteStatus.deleted)
            {
              return BlocProvider.value(
                  value: GetDeletedNotesCubit.of(context),
                  child: AddNoteScreen(note: note,noteStatus: noteStatus));
            }
          else {
            return AddNoteScreen(note: note,noteStatus: noteStatus);
          }
        },
        closedBuilder: (_, action) =>
            _NoteClosedBuilder(note: note, isGrid: isGrid, onTap:action),
      ),
    );
  }
}