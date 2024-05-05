import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/models/note.dart';
class SearchScreenParams{
  final NoteStatus noteStatus;
  final Cubit cubit;
  SearchScreenParams({required this.noteStatus, required this.cubit});
}