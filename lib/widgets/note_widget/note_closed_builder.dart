part of'note_widget.dart';
class _NoteClosedBuilder extends StatelessWidget {
  final Note note;
  final bool isGrid;
  final VoidCallback onTap;
  const _NoteClosedBuilder({required this.note, required this.isGrid, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return Material(
      color: note.color == Colors.transparent.value
          ? Colors.transparent
          : Color(note.color),
      borderRadius: BorderRadius.circular(10),
      elevation: 0,
      child: InkWell(
        onTap: () {
          // if (BlocProvider.of<AppBarCubit>(context).isBase) {
          onTap();
          // } else {
          //   BlocProvider.of<AppBarCubit>(context).selectNotes(note);
          // }
        },
        onLongPress: () {
          // BlocProvider.of<AppBarCubit>(context).selectNotes(note);
        },
        borderRadius: BorderRadius.circular(10),
        child: Container(
            width: double.infinity,
            padding: note.imagePath.isNotEmpty
                ? null
                : const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: note.imagePath.isNotEmpty ? 0.2 : 0.4,
                color: note.color == Colors.transparent.value
                    ? context.theme.colorScheme.primary.withOpacity(0.8)
                    : Colors.transparent,
              ),
            ),
            constraints: const BoxConstraints(minHeight: 40),
            child: _NoteContent(note)),
      ),
    );
  }
}