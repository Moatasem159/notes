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
  final bool delete;
  final List<Note> deletedNotes;
  DeleteNote(this.deletedNotes, this.delete);
}
class DeleteForever extends NotesActionsEvent{
  final List<Note> deletedNotes;
  DeleteForever(this.deletedNotes);
}
class EmptyBin extends NotesActionsEvent{}
class ColorsNote extends NotesActionsEvent{
  final int color;
  final List<Note> notes;
  ColorsNote({required this.color, required this.notes});
}