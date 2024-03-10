part of'default_options_appbar.dart';
class _LabelButton extends StatelessWidget {
  final NoteStatus noteStatus;
  const _LabelButton(this.noteStatus);
  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
        onTap: () {
          List<Label> labels = [];
          List<Note> notes = [];
          labels.addAll(AppBarCubit.of(context).labels);
          notes.addAll(AppBarCubit.of(context).selectedNotes);
          PickLabelParams params;
          if (noteStatus == NoteStatus.archive) {
            params = PickLabelParams(
                notes: notes, labels: labels, notesCubit:  GetArchivedNotesCubit.of(context));
            context.pushNamed(Routes.pickLabelRoute,
                extra: params,
                queryParameters: {
                  "inNote": "false",
                  "noteStatus": noteStatus.toString(),
                });
          }
          else {
            params = PickLabelParams(notes: notes, labels: labels);
            context.pushNamed(Routes.pickLabelRoute,
                extra: params,
                queryParameters: {
                  "inNote": "false",
                  "noteStatus": noteStatus.toString(),
                });
          }
          AppBarCubit.of(context).removeSelection(clearList: true);
        },
        icon: const Icon(Icons.label_outline_rounded));
  }
}