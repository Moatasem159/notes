import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes/models/note.dart';
abstract class NoteLocalDataSource {
  Future<int> addNote(Note note);
  Future<void> archiveNotes(List<Note> notes,bool archive);
  Future<void> archiveNote(Note note,bool archive);
  List<Note> getNotes();
}
class NoteLocalDataSourceImpl implements NoteLocalDataSource {
  final Box<Note> _box;
  NoteLocalDataSourceImpl(this._box);
  @override
  Future<int> addNote(Note note) async{
    return await _box.add(note);
  }
  @override
  List<Note> getNotes() {
    return _box.values.toList();
  }
  @override
  Future<void> archiveNote(Note note,bool archive) async{
    note.status==NoteStatus.archive;
    await note.save();
  }
  @override
  Future<void> archiveNotes(List<Note> notes,bool archive)async{
    if(archive){
        for (Note note in notes) {
          note.pinned=false;
          note.status=NoteStatus.archive;
          await note.save();
        }
      }
    else{
      for (Note note in notes) {
        note.status=NoteStatus.active;
        await note.save();
      }
    }
  }
}