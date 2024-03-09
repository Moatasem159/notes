import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes/models/label.dart';
import 'package:notes/models/note.dart';
abstract class LabelLocalDataSource {
  Future<int> addLabel(Label label);
  List<Label> getLabel();
}

class LabelLocalDataSourceImpl implements LabelLocalDataSource {
  final Box<Note> _noteBox;
  final Box<Label> _labelBox;
  LabelLocalDataSourceImpl(this._noteBox,this._labelBox);
  @override
  Future<int> addLabel(Label label) async {
    return await _labelBox.add(label);
  }
  @override
  List<Label> getLabel() {
    return _labelBox.values.toList();
  }

}
