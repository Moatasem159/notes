import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/models/note.dart';
import 'package:notes/sources/notes_data_source.dart';
part 'get_active_notes_state.dart';
class GetActiveNotesCubit extends Cubit<GetActiveNotesStates> {
  GetActiveNotesCubit(this._dataSource) : super(GetActiveNotesInitialState()){
    notes=[];
  }
  final NoteLocalDataSource _dataSource;
  late List<Note> notes;
  static GetActiveNotesCubit of(BuildContext context)=>BlocProvider.of(context);
  getNotes({bool edit=false})async{
    if(edit)
      {
        await Future.delayed(const Duration(milliseconds: 500));
      }
    notes=_dataSource.getNotes().where((element)=>element.status==NoteStatus.active).toList();
    emit(GetActiveNotesSuccessState());
  }

  remove(Note note){
    notes.remove(note);
    emit(RemoveState());
  }
  @override
  Future<void> close() {
    notes.clear();
    return super.close();
  }
}