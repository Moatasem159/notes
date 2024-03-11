import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/models/label.dart';
import 'package:notes/models/note.dart';
import 'package:notes/sources/notes_data_source.dart';

part 'get_labeled_notes_state.dart';

class GetLabeledNotesCubit extends Cubit<GetLabeledNotesStates> {
  GetLabeledNotesCubit(this._dataSource, this.label)
      : super(GetLabeledNotesInitialState());
  final String label;
  final NoteLocalDataSource _dataSource;
  static GetLabeledNotesCubit of(BuildContext context) => BlocProvider.of(context);
  getLabeledNotes() {
    List<Note> notes = _dataSource.getNotes().where((element) => element.labeled == true && element.status != NoteStatus.deleted).toList();
    notes.removeWhere((Note note) {
      Label label = note.labels.firstWhere((Label element) => element.name == this.label, orElse: () => Label(name: ''));
      return label.name == "";
    });
    List<Note> pinnedNote = notes.where((note) => note.pinned==true).toList();
    List<Note> archivedNote=notes.where((note) => note.status==NoteStatus.archive).toList();
    notes.removeWhere((Note note)=>note.pinned||note.status==NoteStatus.archive);
    emit(GetLabeledNotesSuccessState(notes,pinnedNote,archivedNote));
  }
}