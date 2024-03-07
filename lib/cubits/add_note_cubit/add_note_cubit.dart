import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:notes/core/image/image_helper.dart';
import 'package:notes/models/note.dart';
import 'package:notes/sources/notes_data_source.dart';
part 'add_note_state.dart';
class AddNoteCubit extends Cubit<AddNoteStates> {
  AddNoteCubit(this._dataSource, {required this.note}) : super(AddNoteInitialState()) {
    isNew=note==null?true:false;
    note ??= Note(date: DateTime.now().toIso8601String(),color: Colors.transparent.value);
    title = TextEditingController(text: note!.title);
    content = TextEditingController(text: note!.note);
    restored=!(note!.status==NoteStatus.deleted);
  }

  static AddNoteCubit of(BuildContext context) => BlocProvider.of(context);
  late final TextEditingController title;
  final NoteLocalDataSource _dataSource;
  late final TextEditingController content;
  Note? note;
  late bool restored;
  late bool isNew;

  Future<void> addNote() async {
    emit(AddNoteLoadingState());
    if (note!.isEmpty()) {
      return emit(AddNoteSuccessState(false));
    }
    int result = await _dataSource.addNote(note!);
    if (result != -1) {
      emit(AddNoteSuccessState(true));
    } else {
      emit(AddNoteErrorState());
    }
  }
  Future<void> editNote() async {
    note!.date = DateTime.now().toIso8601String();
    note!.save();
    emit(EditNoteSuccessState());
  }
  changeColor(int value) {
    note!.color = value;
    emit(ChangeColorState());
  }
  changeArchiveNote() {
    if (note!.status == NoteStatus.archive) {
      note!.status = NoteStatus.active;
    } else if (note!.status == NoteStatus.active) {
      note!.status = NoteStatus.archive;
      note!.pinned = false;
    }
    emit(ChangeNoteStatusState());
  }
  changePinNote() {
    note!.pinned = !note!.pinned;
    if (note!.pinned) {
      note!.status = NoteStatus.active;
    }
    emit(ChangePinNoteState());
  }
  restoreNote() {
    note!.status = NoteStatus.active;
    restored=true;
    emit(RestoreNoteState());
  }
  deleteForever(){
    if(note!.imagePath!='')
      {
        ImageHelper.deleteImageFile(note!.imagePath);
      }
    note!.delete();
    emit(DeleteNoteForeverState());
  }
  deleteNote(){
    if(!isNew)
      {
        note!.status = NoteStatus.deleted;
        note!.save();
      }
    else{
      note!.clear();
    }
    emit(DeleteNoteState());
  }
  Future<void> getImage(ImageSource imageSource) async {
    note!.imagePath = await ImageHelper.pickImage(imageSource);
    emit(PickImageState());
  }
  removeImage() {
    ImageHelper.deleteImageFile(note!.imagePath);
    note!.imagePath = '';
    emit(RemoveImageState());
  }
}
