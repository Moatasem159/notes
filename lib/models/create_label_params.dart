import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:notes/models/label.dart';
import 'package:notes/models/note.dart';
class CreateLabelParams{
  final bool isNew;
  final Cubit? notesCubit;
  final NoteStatus notesStatus;
  final Label? label;
  CreateLabelParams({this.label,required this.isNew,this.notesCubit, this.notesStatus=NoteStatus.active});
}