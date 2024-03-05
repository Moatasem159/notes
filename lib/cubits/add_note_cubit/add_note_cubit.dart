import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:notes/core/image/image_helper.dart';
import 'package:notes/models/note.dart';
part 'add_note_state.dart';
class AddNoteCubit extends Cubit<AddNoteStates> {
  AddNoteCubit({required this.note}) : super(AddNoteInitialState()){
    note ??= Note(date: DateTime.now().toIso8601String(),color: Colors.transparent.value);
    title=TextEditingController(text: note!.title);
    content=TextEditingController(text: note!.note);
  }
  static AddNoteCubit of(BuildContext context)=>BlocProvider.of(context);
  late final TextEditingController title;
  late final TextEditingController content;
  Note ?note;
  changeColor(int value){
    note!.color=value;
    emit(ChangeColorState());
  }
  Future<void> getImage(ImageSource imageSource) async {
    note!.imagePath=await ImageHelper.pickImage(imageSource);
    emit(PickImageState());
  }
  removeImage(){
    ImageHelper.deleteImageFile(note!.imagePath);
    note!.imagePath='';
    emit(RemoveImageState());
  }
}
