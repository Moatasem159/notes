part of'home_screen_body.dart';
class HomeScreenBodyBuilder extends StatelessWidget {
  const HomeScreenBodyBuilder({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetActiveNotesCubit, GetActiveNotesStates>(
      builder: (context, state) {
        if (state is GetActiveNotesSuccessState && state.notes.isNotEmpty && state.pinnedNotes.isNotEmpty) {
          return _FirstBody(notes: state.notes,pinnedNotes: state.pinnedNotes);
        } else if (state is GetActiveNotesSuccessState && state.notes.isNotEmpty && state.pinnedNotes.isEmpty) {
          return _SecondBody(notes:state.notes);
        } else if (state is GetActiveNotesSuccessState && state.notes.isEmpty && state.pinnedNotes.isNotEmpty) {
          return _ThirdBody(pinnedNotes: state.pinnedNotes);
        }
        return CustomScrollList(
          slivers: [
            const HomeAppBar(),
            EmptyBody(title: context.local.homeBodyTitle,icon: Icons.lightbulb_outline_rounded)
          ],
        );
      },
    );
  }
}