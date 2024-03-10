import 'package:notes/models/label.dart';
import 'package:notes/models/note.dart';
class PickLabelParams{
  final List<Note> notes;
  final List<Label> labels;
  PickLabelParams({required this.notes, required this.labels});
}