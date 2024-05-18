import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/models/label.dart';
import 'package:notes/sources/labels_data_source.dart';
import 'package:notes/widgets/create_label_screen/edit_label_field.dart';
part 'label_actions_state.dart';

part 'label_actions_event.dart';
class LabelActionsBloc extends Bloc<LabelActionsEvents, LabelActionsStates> {
  LabelActionsBloc(this._dataSource) : super(LabelActionsInitialState()) {
    labels = [];
    actionHappened = false;
    listKey = GlobalKey<SliverAnimatedListState>();
    on<GetLabelsEvent>(getLabels);
    on<AddLabelEvent>(addLabel);
    on<DeleteLabelEvent>(deleteLabel);
    on<EditLabelEvent>(editLabel);
  }
  late final GlobalKey<SliverAnimatedListState> listKey;
  final LabelLocalDataSource _dataSource;
  late bool actionHappened;
  static LabelActionsBloc of(BuildContext context) => BlocProvider.of(context);
  late List<Label> labels;
  Future<void> addLabel(AddLabelEvent event, Emitter<LabelActionsStates> emit) async {
    emit(AddLabelLoadingState());
    String name = event.label.trim();
    Label label = Label(name: name);
    await _dataSource.addLabel(label);
    labels.insert(0, label);
    listKey.currentState?.insertItem(0,duration: const Duration(milliseconds: 300));
    emit(AddLabelSuccessState());
  }

  Future<void> deleteLabel(
      DeleteLabelEvent event, Emitter<LabelActionsStates> emit) async {
    emit(DeleteLabelLoadingState());
    await _dataSource.deleteLabel(event.label);
    actionHappened = true;
    if (event.index != null) {
      final Label removedItem = labels.removeAt(event.index!);
      listKey.currentState?.removeItem(
        event.index!,duration: const Duration(milliseconds: 300),
        (context, animation) {
          return EditLabelField(
            animation: animation,
            index: event.index!,
            label: removedItem);
        }
      );
    } else {
      labels.remove(event.label);
    }
    emit(DeleteLabelSuccessState());
  }
  Future<void> editLabel(EditLabelEvent event, Emitter<LabelActionsStates> emit) async {
    emit(EditLabelLoadingState());
    await _dataSource.renameLabel(event.label, event.newName);
    actionHappened = true;
    emit(EditLabelSuccessState());
  }
  bool checkFound(String name) {
    bool found = false;
    for (Label element in labels) {
      if (element.name == name) {
        found = true;
        break;
      }
    }
    return found;
  }
  Future<void> getLabels(GetLabelsEvent event, Emitter<LabelActionsStates> emit) async {
    labels = _dataSource.getLabel();
    listKey.currentState!.insertAllItems(0, labels.length,duration: Duration.zero);
    emit(GetLabelsState());
  }
}
