import 'package:flutter/cupertino.dart';
import 'package:notes/models/label.dart';
import 'package:notes/models/note.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/sources/labels_data_source.dart';
import 'package:notes/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes/cubits/get_active_notes_cubit/get_active_notes_cubit.dart';
import 'package:notes/cubits/get_labeled_notes_cubit/get_labeled_notes_cubit.dart';
import 'package:notes/cubits/get_archived_notes_cubit/get_archived_notes_cubit.dart';
part 'pick_labels_state.dart';
class PickLabelsCubit extends Cubit<PickLabelsStates> {
  final LabelLocalDataSource _dataSource;
  final List<Note>? notes;
  List<Label>? labels;
  final NoteStatus noteStatus;
  PickLabelsCubit(this._dataSource, {this.noteStatus = NoteStatus.active, this.notes, this.labels}):super(GetLabelsInitialState()) {
    filteredLabels=[];
    controller=TextEditingController();
    controller.addListener(getLabels);
  }
  static PickLabelsCubit of(BuildContext context) => BlocProvider.of(context);
  late final TextEditingController controller;
  late List<Label> filteredLabels;
  pickLabelsForMultipleNotes() async {
    emit(PickLabelsLoadingState());
    await _dataSource.pickLabelForMultipleNotes(notes!, labels!);
    emit(PickLabelsSuccessState());
  }
  picLabelsForNote() async {
    emit(PickLabelsForNoteSuccessState());
  }
  void getLabels() {
    String searchText = controller.text.toLowerCase();
    if (searchText.isEmpty) {
      filteredLabels=_markLabel(_dataSource.getLabel());
    } else {
      filteredLabels = _markLabel(_dataSource.getLabel().where((label) => label.name.toLowerCase().contains(searchText)).toList());
    }
    emit(GetLabelsSuccessState());
  }
  appbarListener(BuildContext context, PickLabelsStates state) {
    if (state is PickLabelsSuccessState &&
        PickLabelsCubit.of(context).noteStatus == NoteStatus.labeled) {
      GetLabeledNotesCubit.of(context).getLabeledNotes();
    }
    if (state is PickLabelsSuccessState &&
        PickLabelsCubit.of(context).noteStatus == NoteStatus.archive) {
      GetArchivedNotesCubit.of(context).getArchivedNotes();
    }
    if (state is PickLabelsSuccessState && PickLabelsCubit.of(context).noteStatus == NoteStatus.active) {
      GetActiveNotesCubit.of(context).getNotes();
    }
    if (state is PickLabelsForNoteSuccessState) {
      AddNoteCubit.of(context).pickLabel(labels!);
    }
  }
  List<Label> _markLabel(List<Label> unMarkedLabels) {
    if (labels != null && unMarkedLabels.isNotEmpty) {
      for (Label unMarkedLabel in unMarkedLabels) {
        Label? tmp = labels!.firstWhere(
            (label) => label.name == unMarkedLabel.name,
            orElse: () => Label(name: ''));
        unMarkedLabel.checkType =
            tmp.name.isEmpty ? CheckType.none : tmp.checkType;
      }
    }
    return unMarkedLabels;
  }
  @override
  Future<void> close() {
    notes?.clear();
    labels?.clear();
    filteredLabels.clear();
    controller.removeListener(getLabels);
    controller.dispose();
    return super.close();
  }
}