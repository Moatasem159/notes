part of 'get_active_notes_cubit.dart';
abstract class GetActiveNotesStates {}
class GetActiveNotesInitialState extends GetActiveNotesStates {}
class GetActiveNotesLoadingState extends GetActiveNotesStates {}
class GetActiveNotesSuccessState extends GetActiveNotesStates {
  final List<Note> notes;
  final List<Note> pinnedNotes;
  GetActiveNotesSuccessState({required this.notes, required this.pinnedNotes});
}
