part of'../label_screen_body.dart';
class _LabelEmptyBody extends StatelessWidget {
  const _LabelEmptyBody();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetLabeledNotesCubit, GetLabeledNotesStates>(
      builder: (context, state) {
        if (state is GetLabeledNotesSuccessState &&
            state.notes.isEmpty &&
            state.pinnedNotes.isEmpty &&
            state.archivedNotes.isEmpty) {
          return EmptyBody(
            title: context.local.labeledBodyTitle,
            icon: Icons.label_outline_rounded,
          );
        }
        return const SliverToBoxAdapter();
      },
    );
  }
}