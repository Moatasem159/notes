import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/models/note.dart';
import 'package:notes/sources/notes_data_source.dart';
part 'get_active_notes_state.dart';
class GetActiveNotesCubit extends Cubit<GetActiveNotesStates> {
  GetActiveNotesCubit(this._dataSource) : super(GetActiveNotesInitialState());
  final NoteLocalDataSource _dataSource;
  static GetActiveNotesCubit of(BuildContext context)=>BlocProvider.of(context);
  getNotes({bool edit=false})async{
    if(edit)
      {
        await Future.delayed(const Duration(milliseconds: 500));
      }
    late List<Note> notes;
    late List<Note> pinnedNotes;
    notes=_dataSource.getNotes().where((element)=>element.pinned==false&&element.status==NoteStatus.active).toList();
    pinnedNotes=_dataSource.getNotes().where((element)=>element.pinned==true&&element.status==NoteStatus.active).toList();
    emit(GetActiveNotesSuccessState(notes: notes,pinnedNotes: pinnedNotes));
  }
}