part of 'add_note_cubit.dart';
abstract class AddNoteStates {}
class AddNoteInitialState extends AddNoteStates {}
class AddNoteSuccessState extends AddNoteStates {
  final bool isAdded;
  AddNoteSuccessState(this.isAdded);
}
class EditNoteSuccessState extends AddNoteStates {}
class AddNoteLoadingState extends AddNoteStates {}
class AddNoteErrorState extends AddNoteStates {}
class ChangeColorState extends AddNoteStates {}
class ChangePinNoteState extends AddNoteStates {}
class PickImageState extends AddNoteStates {}
class RemoveImageState extends AddNoteStates {}