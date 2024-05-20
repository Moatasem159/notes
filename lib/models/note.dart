import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes/core/functions/format_date.dart';
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
  @HiveField(9)
  DateTime ?reminderDate;
  @HiveField(10)
  TimeOfDay ?reminderTime;

  Note({
    this.title = '',
    this.note = '',
    this.status = NoteStatus.active,
    this.pinned = false,
    this.labeled = false,
    this.labels = const [],
    this.imagePath = '',
    required this.date,
    this.reminderDate,
    this.reminderTime,
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

  Map<String, String> toMap() {
    return {
      'title': title,
      'note': note,
      'date': date,
      'status': status.toString(),
      'pinned': pinned.toString(),
      'labeled': labeled.toString(),
      'labels': Label.listToJson(labels),
      'color': color.toString(),
      'imagePath': imagePath,
      'reminderDate': reminderDate.toString(),
      'reminderTime': timeOfDayToString(reminderTime!),
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {


    return Note(
      title: map['title'] as String,
      note: map['note'] as String,
      date: map['date'] as String,
      status: map['status'].toString().toNoteStatus(),
      pinned: map['pinned']=="true" ? true : false,
      labeled: map['labeled']=="true" ? true:false,
      labels: Label.listFromJson(map['labels']),
      color: int.parse(map['color']),
      imagePath: map['imagePath'] as String,
      reminderDate: DateTime.parse(map['reminderDate']) ,
      reminderTime: stringToTimeOfDay(map['reminderTime']),
    );
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
extension NoteStatusExtension on String {
  NoteStatus toNoteStatus() {
    switch (this) {
      case 'NoteStatus.active':
        return NoteStatus.active;
      case 'NoteStatus.reminder':
        return NoteStatus.reminder;
      case 'NoteStatus.archive':
        return NoteStatus.archive;
      case 'NoteStatus.deleted':
        return NoteStatus.deleted;
      case 'NoteStatus.labeled':
        return NoteStatus.labeled;
      case 'NoteStatus.searched':
        return NoteStatus.searched;
      default:
        return NoteStatus.active;
    }
  }
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