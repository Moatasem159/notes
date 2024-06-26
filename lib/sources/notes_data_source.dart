import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes/core/image/image_helper.dart';
import 'package:notes/models/note.dart';

abstract class NoteLocalDataSource {
  Future<int> addNote(Note note);
  Future<void> archiveNotes(List<Note> notes, bool archive);
  Future<void> deleteNotes(List<Note> notes, bool delete);
  Future<void> deleteForever(List<Note> notes);
  Future<void> emptyBin();
  Future<void> pinNotes(List<Note> notes, bool pin);
  Future<void> colorNotes(List<Note> notes, int color);
  List<Note> getNotes();
}

class NoteLocalDataSourceImpl implements NoteLocalDataSource {
  final Box<Note> _box;

  NoteLocalDataSourceImpl(this._box);

  @override
  Future<int> addNote(Note note) async {
    return await _box.add(note);
  }

  @override
  List<Note> getNotes() {
    return _box.values.toList();
  }

  @override
  Future<void> archiveNotes(List<Note> notes, bool archive) async {
    if (archive) {
      for (Note note in notes) {
        note.pinned = false;
        note.status = NoteStatus.archive;
        await note.save();
      }
    } else {
      for (Note note in notes) {
        note.status = NoteStatus.active;
        await note.save();
      }
    }
  }

  @override
  Future<void> pinNotes(List<Note> notes, bool pin) async {
    if (pin) {
      for (Note note in notes) {
        note.pinned = false;
        await note.save();
      }
    } else {
      for (Note note in notes) {
        note.pinned = true;
        if (note.status == NoteStatus.archive) {
          note.status = NoteStatus.active;
        }
        await note.save();
      }
    }
  }

  @override
  Future<void> deleteNotes(List<Note> notes, bool delete) async {
    if (delete) {
      for (Note note in notes) {
        note.pinned = false;
        note.status = NoteStatus.deleted;
        await note.save();
      }
    } else {
      for (Note note in notes) {
        note.status = NoteStatus.active;
        await note.save();
      }
    }
  }

  @override
  Future<void> deleteForever(List<Note> notes) async {
    for (Note note in notes) {
      if (note.imagePath != '') {
        ImageHelper.deleteImageFile(note.imagePath);
      }
      await note.delete();
    }
  }

  @override
  Future<void> emptyBin() async {
    List<Note> notes = _box.values.where((element) => element.status == NoteStatus.deleted).toList();
    await deleteForever(notes);
  }

  @override
  Future<void> colorNotes(List<Note> notes, int color) async{
    for (Note note in notes) {
      note.color = color;
      await note.save();
    }
  }
}
