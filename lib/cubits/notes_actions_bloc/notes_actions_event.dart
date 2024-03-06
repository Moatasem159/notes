part of 'notes_actions_bloc.dart';
abstract class NotesActionsEvent {}
class ArchiveNote extends NotesActionsEvent{
  final bool archive;
  final List<Note> archivedNotes;
  ArchiveNote(this.archivedNotes,this.archive);
}
class PinNote extends NotesActionsEvent{
  final bool pin;
  final List<Note> pinnedNotes;
  PinNote(this.pinnedNotes,this.pin);
}
class DeleteNote extends NotesActionsEvent{
  final List<Note> deletedNotes;
  DeleteNote(this.deletedNotes);
}