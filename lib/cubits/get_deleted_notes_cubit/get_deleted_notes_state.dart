part of 'get_deleted_notes_cubit.dart';
abstract class GetDeletedNotesStates {}
class GetDeletedNotesInitialState extends GetDeletedNotesStates {}
class GetDeletedNotesSuccessState extends GetDeletedNotesStates {
  final List<Note>deletedNotes;
  GetDeletedNotesSuccessState(this.deletedNotes);
}
