import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes/models/note.dart';
abstract class NoteLocalDataSource {
  Future<int> addNote(Note note);
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
}