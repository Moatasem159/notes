import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes/models/label.dart';

part 'note.g.dart';

@HiveType(typeId: 0)
class Note extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String note;
  @HiveField(2)
  String date;
  @HiveField(3)
  NoteStatus status;
  @HiveField(4)
  bool pinned;
  @HiveField(5)
  bool labeled;
  @HiveField(6)
  List<Label> labels;
  @HiveField(7)
  int color;
  @HiveField(8)
  String imagePath;

  Note({
    this.title = '',
    this.note = '',
    this.status = NoteStatus.active,
    this.pinned = false,
    this.labeled = false,
    this.labels = const [],
    this.imagePath = '',
    required this.date,
    required this.color,
  });

  bool isEmpty() {
    return title == '' && note == '' && imagePath == '' ? true : false;
  }

  void clear() {
    title = '';
    note = '';
    imagePath = '';
  }
}

@HiveType(typeId: 1)
enum NoteStatus {
  @HiveField(0)
  active,
  @HiveField(1)
  reminder,
  @HiveField(2)
  archive,
  @HiveField(3)
  deleted,
  @HiveField(4)
  labeled,
  @HiveField(5)
  searched,
}
extension GetPinned on List<Note>{
  (bool,bool) listHasPinnedNotes(){
    bool has=false;
    bool allNotesIsNotPinned=false;
    for (Note note in this) {
      if(note.pinned) {
        has =true;
      }
      if(note.pinned==false) {
        allNotesIsNotPinned =true;
      }
    }
    return (has,allNotesIsNotPinned);
  }
}