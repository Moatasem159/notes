import 'package:hive_flutter/hive_flutter.dart';

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
  String label;
  @HiveField(7)
  int color;
  @HiveField(8)
  String background;
  @HiveField(9)
  String imagePath;

  Note({this.title = '',
    this.note = '',
    required this.date,
    this.status = NoteStatus.active,
    this.pinned = false,
    this.labeled = false,
    this.label = '',
    required this.color,
    this.imagePath = '',
    this.background = ''});
  bool isEmpty() {
    return title == '' && note == '' && imagePath == '' ? true : false;
  }
  void clear() {
    title='';
    note='';
    imagePath='';
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
  deleted
}
