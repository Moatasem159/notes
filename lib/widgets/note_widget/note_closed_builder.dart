part of 'note_widget.dart';

class _NoteClosedBuilder extends StatelessWidget {
  final Note note;
  final bool isGrid;
  final VoidCallback onTap;
  const _NoteClosedBuilder({required this.note, required this.isGrid, required this.onTap});
  BoxBorder _border(BuildContext context) {
    return Border.all(
      width: AppBarCubit.of(context).selectedNotes.contains(note)
          ? 2.5
          : (note.imagePath.isNotEmpty ? 0.2 : 0.4),
      color: AppBarCubit.of(context).selectedNotes.contains(note)
          ? Colors.blueAccent
          : (note.color == Colors.transparent.value
          ? Theme.of(context).primaryColorLight
          : Colors.transparent),
    );
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBarCubit, AppBarStates>(
      builder: (context, state) {
        return Material(
          color: note.color == Colors.transparent.value
              ? Colors.transparent
              : Color(note.color),
          borderRadius: BorderRadius.circular(10),
          elevation: 0,
          child: InkWell(
            onTap: () {
              if (AppBarCubit.of(context).isBase) {
                onTap();
              } else {
                AppBarCubit.of(context).selectNote(note);
              }
            },
            onLongPress: () {
              AppBarCubit.of(context).selectNote(note);
            },
            borderRadius: BorderRadius.circular(10),
            child: Container(
                width: double.infinity,
                padding: note.imagePath.isNotEmpty
                    ? null
                    : const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: _border(context),
                ),
                constraints: const BoxConstraints(minHeight: 40),
                child: _NoteContent(note)),
          ),
        );
      },
    );
  }
}
