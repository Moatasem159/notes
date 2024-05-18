import 'package:flutter/cupertino.dart';
import 'package:notes/models/label.dart';
import 'package:notes/models/note.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/sources/labels_data_source.dart';
import 'package:notes/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes/cubits/get_active_notes_cubit/get_active_notes_cubit.dart';
import 'package:notes/cubits/get_labeled_notes_cubit/get_labeled_notes_cubit.dart';
import 'package:notes/cubits/get_archived_notes_cubit/get_archived_notes_cubit.dart';
import 'package:notes/widgets/pick_label_screen/custom_check_list_tile.dart';
part 'pick_labels_state.dart';
class PickLabelsCubit extends Cubit<PickLabelsStates> {
  final LabelLocalDataSource _dataSource;
  final List<Note> notes;
  List<Label> labels;
  late List<Label> filteredLabels;
  late List<Label> allLabels;
  final bool inNote;
  final NoteStatus noteStatus;
  bool notFound = false;
  late final GlobalKey<SliverAnimatedListState> listKey;
  late final TextEditingController controller;
  PickLabelsCubit(this._dataSource,
      {this.noteStatus = NoteStatus.active,
      required this.notes,
      this.inNote = false,
      required this.labels})
      : super(GetLabelsInitialState()) {
    controller = TextEditingController();
    listKey = GlobalKey<SliverAnimatedListState>();
    filteredLabels = [];
  }
  static PickLabelsCubit of(BuildContext context) => BlocProvider.of(context);
  pickLabelsForMultipleNotes() async {
    emit(PickLabelsLoadingState());
    await _dataSource.pickLabelForMultipleNotes(notes, labels);
    emit(PickLabelsSuccessState());
  }
  picLabelsForNote() async {
    emit(PickLabelsForNoteSuccessState());
  }
  void filterLabels({String value = ''}) {
    _remove(value);
    _insert(value);
    _checkLabel(value);
    _markLabel(filteredLabels);
  }
  void _remove(String value) {
    List<Label> toRemove = [];
    List<int> indexToRemove = [];
    for (int i = 0; i < filteredLabels.length; i++) {
      Label element = filteredLabels[i];
      if (!element.name.toLowerCase().contains(value.toLowerCase())) {
        toRemove.add(element);
        indexToRemove.add(i);
      }
    }
    for (int i = toRemove.length - 1; i >= 0; i--) {
      filteredLabels.remove(toRemove[i]);
      listKey.currentState?.removeItem(indexToRemove[i],
          (context, animation) => CustomCheckListTile(animation: animation),
          duration: const Duration(milliseconds: 200));
    }
  }
  void _insert(String value) {
    for (int i = 0; i < allLabels.length; i++) {
      if (allLabels[i].name.toLowerCase().contains(value.toLowerCase())) {
        if (!filteredLabels.contains(allLabels[i])) {
          if(filteredLabels.isEmpty) {
            filteredLabels.insert(0, allLabels[i]);
            listKey.currentState?.insertItem(0, duration: const Duration(milliseconds: 200));
          } else if (i > filteredLabels.length) {
            filteredLabels.insert(filteredLabels.length-1, allLabels[i]);
            listKey.currentState?.insertItem(filteredLabels.length-1,
                duration: const Duration(milliseconds: 200));
          } else {
            filteredLabels.insert(i, allLabels[i]);
            listKey.currentState?.insertItem(i, duration: const Duration(milliseconds: 200));
          }
        }
      }
    }
  }
  void _checkLabel(String value) {
    Label tmp = allLabels.firstWhere(
        (Label element) => element.name.toLowerCase() == value.toLowerCase(),
        orElse: () => Label(name: ""));
    if (value.isEmpty) {
      notFound = false;
    } else if (tmp.name.isEmpty) {
      notFound = true;
    }
    emit(CheckLabelState());
  }
  void getInitialLabels() {
    allLabels = _markLabel(_dataSource.getLabel());
    filteredLabels.addAll(allLabels);
    listKey.currentState
        ?.insertAllItems(0, allLabels.length, duration: Duration.zero);
  }
  void createNewLabel() async {
    String name = controller.text.trim();
    Label label = Label(name: name, checkType: CheckType.all);
    await _dataSource.addLabel(label);
    labels.insert(0, label);
    filteredLabels.insert(0, label);
    allLabels.insert(0, label);
    listKey.currentState?.insertItem(0, duration: const Duration(milliseconds: 200));
    controller.clear();
    FocusManager.instance.primaryFocus!.unfocus();
    filterLabels();
  }
  List<Label> _markLabel(List<Label> unMarkedLabels) {
    if (unMarkedLabels.isNotEmpty) {
      for (Label unMarkedLabel in unMarkedLabels) {
        Label? tmp = labels.firstWhere(
            (label) => label.name == unMarkedLabel.name,
            orElse: () => Label(name: ''));
        unMarkedLabel.checkType =
            tmp.name.isEmpty ? CheckType.none : tmp.checkType;
      }
    }
    return unMarkedLabels;
  }
  chooseLabel(CheckType checkType, int index) {
    if (checkType == CheckType.all) {
      Label label = labels.firstWhere(
          (Label element) => element.name == filteredLabels[index].name,
          orElse: () => Label(name: ""));
      if (labels.isNotEmpty) {
        labels.remove(label);
      }
      labels.add(
          Label(name: filteredLabels[index].name, checkType: CheckType.all));
    } else if (!inNote && checkType == CheckType.none) {
      labels
          .firstWhere(
              (Label element) => element.name == filteredLabels[index].name)
          .checkType = CheckType.none;
    } else if (inNote && checkType == CheckType.none) {
      Label label = labels.firstWhere(
          (Label element) => element.name == filteredLabels[index].name);
      labels.remove(label);
    }
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
    if (state is PickLabelsSuccessState &&
        PickLabelsCubit.of(context).noteStatus == NoteStatus.active) {
      GetActiveNotesCubit.of(context).getNotes();
    }
    if (state is PickLabelsForNoteSuccessState) {
      AddNoteCubit.of(context).pickLabel(labels);
    }
  }
  @override
  Future<void> close() {
    notes.clear();
    labels.clear();
    controller.dispose();
    return super.close();
  }
}