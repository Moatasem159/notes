part of 'notes_actions_bloc.dart';
abstract class NotesActionsState {}
class NotesActionsInitial extends NotesActionsState {}
class ActionLoadingState extends NotesActionsState{}
class ActionSuccessState extends NotesActionsState{}
class ActionErrorState extends NotesActionsState{}
