import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/models/note.dart';
import 'package:notes/sources/notes_data_source.dart';
part 'get_archived_notes_state.dart';
class GetArchivedNotesCubit extends Cubit<GetArchivedNotesStates> {
  final NoteLocalDataSource _dataSource;
  GetArchivedNotesCubit(this._dataSource) : super(ArchivedNotesInitialState());
  static GetArchivedNotesCubit of(BuildContext context)=>BlocProvider.of(context);
  getArchivedNotes({bool edit=false})async{
    if(edit)
      {
        await Future.delayed(const Duration(milliseconds: 500));
      }
    List<Note> archivedNotes=[];
    archivedNotes=_dataSource.getNotes().where((element)=>element.status==NoteStatus.archive).toList();
    emit(GetArchivedNotesSuccessState(archivedNotes));
  }
}