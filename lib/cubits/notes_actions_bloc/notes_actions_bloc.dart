import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/models/note.dart';
import 'package:notes/sources/notes_data_source.dart';
part 'notes_actions_event.dart';

part 'notes_actions_state.dart';
class NotesActionsBloc extends Bloc<NotesActionsEvent, NotesActionsState> {
  final NoteLocalDataSource _dataSource;
  NotesActionsBloc(this._dataSource) : super(NotesActionsInitial()) {
    on<ArchiveNote>((ArchiveNote event, emit) => archive(
          emit,
          event.archivedNotes,
          event.archive,
        ));
    on<PinNote>((PinNote event, emit) => pin(
          emit,
          event.pinnedNotes,
          event.pin,
        ));
    on<DeleteNote>((DeleteNote event, emit) => delete(
          emit,
          event.deletedNotes,
          event.delete,
        ));
    on<DeleteForever>((DeleteForever event, emit) => deleteForever(
          emit,
          event.deletedNotes,
        ));
  }
  static NotesActionsBloc of(BuildContext context) => BlocProvider.of(context);
  Future<void> archive(emit, List<Note> archivedNotes, bool archive) async {
    emit(ActionLoadingState());
    await _dataSource.archiveNotes(archivedNotes, archive);
    emit(ActionSuccessState());
  }
  Future<void> pin(emit, List<Note> pinNotes, bool pin) async {
    emit(ActionLoadingState());
    await _dataSource.pinNotes(pinNotes, pin);
    emit(ActionSuccessState());
  }
  Future<void> delete(emit, List<Note> deletedNotes, bool delete) async {
    emit(ActionLoadingState());
    await _dataSource.deleteNotes(deletedNotes, delete);
    emit(ActionSuccessState());
  }
  Future<void> deleteForever(emit, List<Note> deletedNotes) async {
    emit(ActionLoadingState());
    await _dataSource.deleteForever(deletedNotes);
    emit(ActionSuccessState());
  }
}