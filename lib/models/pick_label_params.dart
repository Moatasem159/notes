import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes/models/label.dart';
import 'package:notes/models/note.dart';

class PickLabelParams {
  final List<Note> notes;
  final List<Label> labels;
  final bool inNote;
  final AddNoteCubit? addNoteCubit;
  final Cubit? notesCubit;
  final NoteStatus noteStatus;

  PickLabelParams({
    this.notesCubit,
    this.inNote = false,
    this.addNoteCubit,
    this.noteStatus = NoteStatus.active,
    required this.notes,
    required this.labels,
  });
}
