import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/core/image/image_helper.dart';
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
  // deleteNotes(){
  //   for (var element in selectedNotes){
  //     if(element.imagePath!=""){
  //        ImageHelper.deleteImageFile(element.imagePath);
  //     }
  //     element.delete();
  //   }
  //   selectedNotes.clear();
  //   hideOptionAppBar();
  //   emit(DeleteNotesSuccessState());
  // }
  pinNotes(){
    for (var element in selectedNotes){
      if(isPinned)
        {
          if(element.pinned==true){
            element.pinned=false;
            element.save();
          }
        }
      else{
        if(element.pinned==false){
          element.pinned=true;
          element.save();
        }
      }
    }
    selectedNotes.clear();
    isPinned=false;
    hideOptionAppBar();
    emit(PinNotesSuccessState());
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