part of'get_archived_notes_cubit.dart';
abstract class GetArchivedNotesStates {}
class ArchivedNotesInitialState extends GetArchivedNotesStates {}
class GetArchivedNotesSuccessState extends GetArchivedNotesStates {
  final List<Note>archiveNotes;
  GetArchivedNotesSuccessState(this.archiveNotes);
}