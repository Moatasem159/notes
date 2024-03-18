import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes/models/label.dart';
import 'package:notes/models/note.dart';
abstract class LabelLocalDataSource {
  Future<int> addLabel(Label label);
  Future <void> deleteLabel(Label label);
  Future <void> renameLabel(Label label,String newName);
  List<Label> getLabel();
  Future<void> pickLabelForMultipleNotes(List<Note> notes, List<Label> labels);
}
class LabelLocalDataSourceImpl implements LabelLocalDataSource {
  final Box<Note> _noteBox;
  final Box<Label> _labelBox;
  LabelLocalDataSourceImpl(this._noteBox, this._labelBox);
  @override
  Future<int> addLabel(Label label) async {
    return await _labelBox.add(label);
  }
  @override
  List<Label> getLabel() {
    return _labelBox.values.toList();
  }
  @override
  Future<void> pickLabelForMultipleNotes(List<Note> notes, List<Label> labels) async {
    for (int i = 0; i < notes.length; i++) {
      for (Label label in labels) {
        bool found = false;
        for (Label labelInNote in notes[i].labels) {
          if (labelInNote.name == label.name) {
            found = true;
            break;
          }
        }
        if (!found && label.checkType == CheckType.all) {
          notes[i].labels.add(label);
        }
        if (found && label.checkType == CheckType.none) {
          Label tmp = notes[i]
              .labels
              .firstWhere((element) => element.name == label.name);
          notes[i].labels.remove(tmp);
        }
        notes[i].labels.isEmpty
            ? notes[i].labeled = false
            : notes[i].labeled = true;
      }
      await notes[i].save();
    }
  }
  @override
  Future<void> deleteLabel(Label label) async{
    List<Note>notes = _noteBox.values.where((element) => element.labeled == true).toList();
    for(Note note in notes)
      {
        Label tmp =note.labels.firstWhere((element) => element.name==label.name,orElse: () => Label(name: ''),);
        if(tmp.name.isNotEmpty)
          {
            note.labels.remove(tmp);
            note.labels.isEmpty?note.labeled=false:null;
            await note.save();
          }
      }
     await label.delete();
  }
  @override
  Future<void> renameLabel(Label label, String newName)async{
    List<Note>notes = _noteBox.values.where((element) => element.labeled == true).toList();
    Label newLabel =Label(name: newName);
    String oldName = label.name;
    label.name=newName;
    for(Note note in notes)
    {
      Label label= note.labels.firstWhere((element) => element.name==oldName,orElse: () => Label(name: ""));
      if(label.name.isEmpty)
        {
          continue;
        }
      int index=note.labels.indexOf(label);
      note.labels.removeAt(index);
      note.labels.insert(index, newLabel);
      await note.save();
    }
    await label.save();
  }
}
