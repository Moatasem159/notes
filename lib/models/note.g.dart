// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NoteAdapter extends TypeAdapter<Note> {
  @override
  final int typeId = 0;

  @override
  Note read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Note(
      title: fields[0] as String,
      note: fields[1] as String,
      status: fields[3] as NoteStatus,
      pinned: fields[4] as bool,
      labeled: fields[5] as bool,
      labels: (fields[6] as List).cast<Label>(),
      imagePath: fields[8] as String,
      date: fields[2] as String,
      reminderDate: fields[9] as DateTime?,
      reminderTime: fields[10] as TimeOfDay?,
      color: fields[7] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Note obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.note)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.status)
      ..writeByte(4)
      ..write(obj.pinned)
      ..writeByte(5)
      ..write(obj.labeled)
      ..writeByte(6)
      ..write(obj.labels)
      ..writeByte(7)
      ..write(obj.color)
      ..writeByte(8)
      ..write(obj.imagePath)
      ..writeByte(9)
      ..write(obj.reminderDate)
      ..writeByte(10)
      ..write(obj.reminderTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NoteAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class NoteStatusAdapter extends TypeAdapter<NoteStatus> {
  @override
  final int typeId = 1;

  @override
  NoteStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return NoteStatus.active;
      case 1:
        return NoteStatus.reminder;
      case 2:
        return NoteStatus.archive;
      case 3:
        return NoteStatus.deleted;
      case 4:
        return NoteStatus.labeled;
      case 5:
        return NoteStatus.searched;
      default:
        return NoteStatus.active;
    }
  }

  @override
  void write(BinaryWriter writer, NoteStatus obj) {
    switch (obj) {
      case NoteStatus.active:
        writer.writeByte(0);
        break;
      case NoteStatus.reminder:
        writer.writeByte(1);
        break;
      case NoteStatus.archive:
        writer.writeByte(2);
        break;
      case NoteStatus.deleted:
        writer.writeByte(3);
        break;
      case NoteStatus.labeled:
        writer.writeByte(4);
        break;
      case NoteStatus.searched:
        writer.writeByte(5);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NoteStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
