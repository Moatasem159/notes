import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/models/note.dart';
part 'app_bar_state.dart';
class AppBarCubit extends Cubit<AppBarStates> {
  AppBarCubit() : super(AppBarInitialState()) {
    isBase = true;
    isPinned = false;
    selectedNotes = [];
  }
  static AppBarCubit of(BuildContext context)=>BlocProvider.of(context);
  late bool isBase;
  late bool isPinned;
  late List<Note> selectedNotes;
  showOptionAppBar(){
    if(selectedNotes.length==1){
      isBase=false;
    }
  }
  hideOptionAppBar(){
    if(selectedNotes.isEmpty){
      isBase=true;
    }
  }
  _selectNotes(Note note){
    selectedNotes.add(note);
  }
  _unselectNotes(Note note){
    selectedNotes.remove(note);
  }
  selectNote(Note note){
    if(selectedNotes.contains(note))
    {
      _unselectNotes(note);
      if(selectedNotes.isEmpty)
      {
        isPinned = false;
      }
      hideOptionAppBar();
    }
    else{
      _selectNotes(note);
       showOptionAppBar();
    }
    _changeIsPinned();
    emit(SelectNoteState());
  }
  removeSelection(){
    selectedNotes.clear();
    isBase=true;
    isPinned=true;
    emit(RemoveSelectionState());
  }
  _changeIsPinned(){
    for (var element in selectedNotes) {
        if(!element.pinned)
        {
          isPinned = false;
          break;
        }
        else{
          isPinned = true;
        }
      }
    }
  }