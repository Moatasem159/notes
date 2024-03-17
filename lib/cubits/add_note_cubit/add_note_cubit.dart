import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/core/image/image_helper.dart';
import 'package:notes/cubits/get_active_notes_cubit/get_active_notes_cubit.dart';
import 'package:notes/cubits/get_archived_notes_cubit/get_archived_notes_cubit.dart';
import 'package:notes/cubits/get_deleted_notes_cubit/get_deleted_notes_cubit.dart';
import 'package:notes/cubits/get_labeled_notes_cubit/get_labeled_notes_cubit.dart';
import 'package:notes/models/label.dart';
import 'package:notes/models/note.dart';
import 'package:notes/sources/notes_data_source.dart';
import 'package:notes/widgets/toast/custom_toast.dart';
part 'add_note_state.dart';
class AddNoteCubit extends Cubit<AddNoteStates> {
  AddNoteCubit(this._dataSource, {required this.note,required this.noteStatus,required this.label}) : super(AddNoteInitialState()) {
    isNew=note==null?true:false;
    note ??= Note(
        date: DateTime.now().toIso8601String(),
        color: Colors.transparent.value,
        labeled: label!=null?true:false,
        labels: label == null ? [] : [label!]);
    noteStatus??=NoteStatus.active;
    title = TextEditingController(text: note!.title);
    content = TextEditingController(text: note!.note);
    restored=!(note!.status==NoteStatus.deleted);
  }
  static AddNoteCubit of(BuildContext context) => BlocProvider.of(context);
  late final TextEditingController title;
  final NoteLocalDataSource _dataSource;
  late final TextEditingController content;
  Note? note;
  Label ?label;
  NoteStatus? noteStatus;
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
  pickLabel(){
    emit(PickLabelState());
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
        note!.pinned=false;
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
  listen(BuildContext context, AddNoteStates state) {
    if (state is DeleteNoteState) {
      context.pop();
      if (noteStatus == NoteStatus.archive) {
        GetArchivedNotesCubit.of(context).getArchivedNotes(edit: true);
      } else {
        GetActiveNotesCubit.of(context).getNotes(edit: true);
      }
    }
    if (state is AddNoteSuccessState && state.isAdded){
      GetActiveNotesCubit.of(context).getNotes();
      if(noteStatus == NoteStatus.labeled){
        GetLabeledNotesCubit.of(context).getLabeledNotes();
      }
    }
    if (state is RestoreNoteState) {
      CustomToast.showToast(context, msg: context.local.noteRestored);
    }
    if (state is EditNoteSuccessState && noteStatus == NoteStatus.archive) {
      GetArchivedNotesCubit.of(context).getArchivedNotes(edit: true);
    }
    if (state is EditNoteSuccessState && noteStatus == NoteStatus.deleted) {
      GetDeletedNotesCubit.of(context).getDeletedNotes(edit: true);
    }
    if (state is EditNoteSuccessState) {
      GetActiveNotesCubit.of(context).getNotes(edit: true);
    }
    if (state is DeleteNoteForeverState) {
      GetDeletedNotesCubit.of(context).getDeletedNotes(edit: true);
      context.pop();
    }
  }
}