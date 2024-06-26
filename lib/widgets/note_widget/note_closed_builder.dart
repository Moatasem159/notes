part of 'note_widget.dart';

class _NoteClosedBuilder extends StatelessWidget {
  final Note note;
  final VoidCallback onTap;
  final bool isSearch;
  const _NoteClosedBuilder({required this.note,required this.onTap, required this.isSearch});
  BoxBorder _border(BuildContext context) {
    return Border.all(
      width: AppBarCubit.of(context).selectedNotes.contains(note)
          ? 2.5
          : (note.imagePath.isNotEmpty ? 0.2 : 0.4),
      color: AppBarCubit.of(context).selectedNotes.contains(note)
          ? Colors.blueAccent
          : (note.color == Colors.transparent.value
          ? Colors.grey
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
              if(!isSearch) {
                AppBarCubit.of(context).selectNote(note);
              }
            },
            borderRadius: BorderRadius.circular(10),
            child: Container(
                width: double.infinity,
                alignment: AlignmentDirectional.centerStart,
                padding: note.imagePath.isNotEmpty
                    ? null
                    : const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: _border(context),
                ),
                constraints: const BoxConstraints(minHeight: 50),
                child: _NoteContent(note)),
          ),
        );
      },
    );
  }
}
