import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/models/label.dart';
import 'package:notes/models/note.dart';
class PickLabelParams{
  final List<Note> notes;
  final List<Label> labels;
  final Cubit ?addNoteCubit;
  final Cubit ?notesCubit;
  PickLabelParams({this.notesCubit,this.addNoteCubit,required this.notes, required this.labels});
}