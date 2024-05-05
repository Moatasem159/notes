import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/models/note.dart';
import 'package:notes/sources/notes_data_source.dart';
part 'search_state.dart';
class SearchCubit extends Cubit<SearchStates> {
  final NoteLocalDataSource _dataSource;
  final NoteStatus  noteStatus;
  SearchCubit(this._dataSource, this.noteStatus) : super(SearchInitialState()){
    controller =TextEditingController();
  }
  static SearchCubit of(BuildContext context) => BlocProvider.of(context);

 late final TextEditingController controller;
  search({bool edit=false})async{
    if(edit)
    {
      await Future.delayed(const Duration(milliseconds: 500));
    }
    List<Note> notes = _dataSource
        .getNotes()
        .where((element) =>
            (element.note.toLowerCase().contains(controller.text.toLowerCase()) ||
                element.title.toLowerCase().contains(controller.text.toLowerCase())) &&
            element.status != NoteStatus.deleted)
        .toList();
    List<Note> archivedNote =
        notes.where((note) => note.status == NoteStatus.archive).toList();
    notes.removeWhere((Note note) => note.status == NoteStatus.archive);
    if (controller.text== '') {
      emit(SearchInitialState());
    } else {
      emit(GetSearchSuccessState(notes, archivedNote));
    }
  }
  @override
  Future<void> close() {
    controller.dispose();
    return super.close();
  }
}
