import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes/cubits/get_active_notes_cubit/get_active_notes_cubit.dart';
import 'package:notes/cubits/get_archived_notes_cubit/get_archived_notes_cubit.dart';
import 'package:notes/cubits/get_labeled_notes_cubit/get_labeled_notes_cubit.dart';
import 'package:notes/models/label.dart';
import 'package:notes/models/note.dart';
import 'package:notes/sources/labels_data_source.dart';

part 'get_labels_state.dart';

class GetLabelsCubit extends Cubit<GetLabelsStates> {
  final LabelLocalDataSource _dataSource;
  final List<Note>? notes;
  List<Label>? labels;
  final bool inNote;
  final NoteStatus noteStatus;

  GetLabelsCubit(this._dataSource,
      {this.inNote = false,this.noteStatus=NoteStatus.active,this.notes, this.labels})
      : super(GetLabelsInitialState());

  static GetLabelsCubit of(BuildContext context) => BlocProvider.of(context);
  late List<Label> allLabels;

  getLabels() {
    allLabels = _dataSource.getLabel();
    emit(GetLabelsSuccessState());
  }

  pickLabelsForMultipleNotes() async {
    emit(PickLabelsLoadingState());
    await _dataSource.pickLabelForMultipleNotes(notes!, labels!);
    emit(PickLabelsSuccessState());
  }
  picLabelsForNote()async{
    emit(PickLabelsForNoteSuccessState());
  }

  appbarListener(BuildContext context, GetLabelsStates state) {
    if (state is PickLabelsSuccessState&&GetLabelsCubit.of(context).noteStatus==NoteStatus.labeled){
      GetLabeledNotesCubit.of(context).getLabeledNotes();
    }
    if(state is PickLabelsSuccessState&&GetLabelsCubit.of(context).noteStatus==NoteStatus.archive)
    {
      GetArchivedNotesCubit.of(context).getArchivedNotes();
    }
    if(state is PickLabelsSuccessState&&GetLabelsCubit.of(context).noteStatus==NoteStatus.active)
    {
      GetActiveNotesCubit.of(context).getNotes();
    }
    if(state is PickLabelsForNoteSuccessState &&GetLabelsCubit.of(context).inNote)
    {
      if(GetLabelsCubit.of(context).labels!.isNotEmpty) {
        AddNoteCubit.of(context).note!.labels.clear();
        AddNoteCubit.of(context).note!.labels.addAll(GetLabelsCubit.of(context).labels!);
        AddNoteCubit.of(context).note!.labeled=true;
      }
      if(GetLabelsCubit.of(context).labels!.isEmpty)
      {
        AddNoteCubit.of(context).note!.labels.clear();
        AddNoteCubit.of(context).note!.labeled=false;
        AddNoteCubit.of(context).note!.save();
      }
      AddNoteCubit.of(context).pickLabel();
    }
  }
  @override
  Future<void> close() {
    notes?.clear();
    labels?.clear();
    return super.close();
  }
}
