import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/models/label.dart';
import 'package:notes/models/note.dart';
part 'app_bar_state.dart';
class AppBarCubit extends Cubit<AppBarStates> {
  AppBarCubit() : super(AppBarInitialState()) {
    isBase = true;
    isPinned = false;
    selectedNotes = [];
    labels=[];
    colors=[];
  }
  static AppBarCubit of(BuildContext context)=>BlocProvider.of(context);
  late bool isBase;
  late bool isPinned;
  late List<Note> selectedNotes;
  late List<Label> labels;
  late List<int> colors;
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
    _selectLabel(note);
  }
  _selectLabel(Note note){
    for(int i =0;i<note.labels.length;i++)
    {
      Label tmp=note.labels.firstWhere((element) => element.name==note.labels[i].name,orElse: () => Label(name: ""));
      if(tmp.name!='') {
        Label tmp2=labels.firstWhere((element) => element.name==tmp.name,orElse: () => Label(name:""));
        if(tmp2.name=="") {
          labels.add(Label(name: note.labels[i].name,checkType: CheckType.all));
        }
      }
    }
    for (Label label in labels) {
     for(Note note in selectedNotes)
       {
         bool fullMarked=true;
         Label tmp=note.labels.firstWhere((element) => element.name==label.name,orElse: () => Label(name: ""));
         if(tmp.name==''){
           fullMarked=false;
         }
         if(!fullMarked)
         {
           labels.firstWhere((element) => element.name == label.name).checkType=CheckType.semi;
         }
       }
    }
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
      if(colors.contains(note.color)){
        colors.remove(note.color);
      }

      hideOptionAppBar();
    }
    else{
      _selectNotes(note);
      if(!colors.contains(note.color))
      {
        colors.add(note.color);
      }
       showOptionAppBar();
    }
    _changeIsPinned();
    emit(SelectNoteState());
  }
  removeSelection({bool clearList=true}){
    clearList?selectedNotes.clear():null;
    clearList?labels.clear():null;
    colors.clear();
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