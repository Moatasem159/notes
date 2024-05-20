part of 'note_widget.dart';
class _NoteContent extends StatelessWidget {
  final Note note;
  const _NoteContent(this.note);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (note.imagePath.isNotEmpty)
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image(
              fit: BoxFit.cover,
              image: FileImage(
                File(note.imagePath),
              ),
            ),
          ),
        if (note.title.isNotEmpty || note.note.isNotEmpty)
          Padding(
            padding: note.imagePath.isEmpty
                ? EdgeInsets.zero
                : const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (note.title.isNotEmpty)
                  Text(note.title,
                      style: Theme.of(context).textTheme.titleMedium),
                if (note.note.isNotEmpty)
                  Column(
                    children: [
                      if (note.title.isNotEmpty) 10.ph,
                      Text(note.note,
                          maxLines: 40, overflow: TextOverflow.ellipsis),
                    ],
                  ),
              ],
            ),
          ),
        if (note.labeled||note.reminderTime!=null)
          15.ph,
        if(note.imagePath.isNotEmpty)
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: _NoteLabelList(note.labels,note.reminderDate,note.reminderTime),
        ),
        if(note.imagePath.isEmpty)
        _NoteLabelList(note.labels,note.reminderDate,note.reminderTime),
      ],
    );
  }
}