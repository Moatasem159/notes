import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/models/note.dart';
import 'package:notes/sources/notes_data_source.dart';

part 'notes_actions_event.dart';

part 'notes_actions_state.dart';

class NotesActionsBloc extends Bloc<NotesActionsEvent, NotesActionsState> {
  final NoteLocalDataSource _dataSource;
  NotesActionsBloc(this._dataSource) : super(NotesActionsInitial()) {
    on<ArchiveNote>(archive);
    on<PinNote>(pin);
    on<DeleteNote>(delete);
    on<DeleteForever>(deleteForever);
    on<EmptyBin>(emptyBin);
    on<ColorsNote>(colorNote);
  }
  static NotesActionsBloc of(BuildContext context) => BlocProvider.of(context);
  Future<void> archive(ArchiveNote event, Emitter<NotesActionsState> emit) async {
    emit(ActionLoadingState());
    await _dataSource.archiveNotes(event.archivedNotes, event.archive);
    emit(ArchiveSuccessState());
  }
  Future<void> pin(PinNote event, Emitter<NotesActionsState> emit) async {
    emit(ActionLoadingState());
    await _dataSource.pinNotes(event.pinnedNotes, event.pin);
    emit(PinSuccessState());
  }
  Future<void> colorNote(ColorsNote event, Emitter<NotesActionsState> emit) async {
    emit(ActionLoadingState());
    await _dataSource.colorNotes(event.notes, event.color);
    emit(ColorSuccessState());
  }
  Future<void> delete(DeleteNote event, Emitter<NotesActionsState> emit) async {
    emit(ActionLoadingState());
    await _dataSource.deleteNotes(event.deletedNotes, event.delete);
    emit(DeleteSuccessState());
  }
  Future<void> deleteForever(DeleteForever event, Emitter<NotesActionsState> emit) async {
    emit(ActionLoadingState());
    await _dataSource.deleteForever(event.deletedNotes);
    emit(DeleteSuccessState());
  }
  Future<void> emptyBin(EmptyBin event, Emitter<NotesActionsState> emit) async {
    emit(ActionLoadingState());
    await _dataSource.emptyBin();
    emit(DeleteSuccessState());
  }
}
