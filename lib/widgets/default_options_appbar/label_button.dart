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
            params = PickLabelParams(notes: notes, labels: labels,noteStatus: noteStatus,notesCubit: GetArchivedNotesCubit.of(context));
            context.pushNamed(Routes.pickLabelRoute,arguments: params);
          }
          else if(noteStatus == NoteStatus.labeled)
            {
              params = PickLabelParams(noteStatus: noteStatus,notes: notes, labels: labels,notesCubit: GetLabeledNotesCubit.of(context));
              context.pushNamed(Routes.pickLabelRoute, arguments: params);
            }
          else {
            params = PickLabelParams(notes: notes, labels: labels,noteStatus: noteStatus,notesCubit: GetActiveNotesCubit.of(context));
            context.pushNamed(Routes.pickLabelRoute, arguments: params);
          }
          AppBarCubit.of(context).removeSelection();
        },
        icon: const Icon(Icons.label_outline_rounded));
  }
}