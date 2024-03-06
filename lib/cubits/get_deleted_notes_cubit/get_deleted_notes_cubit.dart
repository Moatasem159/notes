import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/models/note.dart';
import 'package:notes/sources/notes_data_source.dart';
part 'get_deleted_notes_state.dart';
class GetDeletedNotesCubit extends Cubit<GetDeletedNotesStates> {
  GetDeletedNotesCubit(this._dataSource) : super(GetDeletedNotesInitialState());
  final NoteLocalDataSource _dataSource;
  static GetDeletedNotesCubit of(BuildContext context)=>BlocProvider.of(context);
  getDeletedNotes({bool edit=false})async{
    if(edit)
    {
      await Future.delayed(const Duration(milliseconds: 500));
    }
    List<Note> deletedNotes=[];
    deletedNotes=_dataSource.getNotes().where((element)=>element.status==NoteStatus.deleted).toList();
    emit(GetDeletedNotesSuccessState(deletedNotes));
  }
}
