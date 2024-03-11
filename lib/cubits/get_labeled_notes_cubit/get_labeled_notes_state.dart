part of 'get_labeled_notes_cubit.dart';
abstract class GetLabeledNotesStates {}
class GetLabeledNotesInitialState extends GetLabeledNotesStates {}
class GetLabeledNotesSuccessState extends GetLabeledNotesStates {
  final List<Note> pinnedNotes;
  final List<Note> notes;
  final List<Note> archivedNotes;
  GetLabeledNotesSuccessState(this.notes, this.pinnedNotes, this.archivedNotes);
}
