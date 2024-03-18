import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/models/label.dart';
import 'package:notes/sources/labels_data_source.dart';
part 'label_actions_state.dart';
part 'label_actions_event.dart';
class LabelActionsBloc extends Bloc<LabelActionsEvents,LabelActionsStates> {
  LabelActionsBloc(this._dataSource) : super(LabelActionsInitialState()){
    labels=[];
    on<GetLabelsEvent>(getLabels);
    on<AddLabelEvent>(addLabel);
    on<DeleteLabelEvent>(deleteLabel);
  }
  final LabelLocalDataSource _dataSource;
  static LabelActionsBloc of(BuildContext context)=>BlocProvider.of(context);
  late List<Label> labels;
  Future<void> addLabel(AddLabelEvent event, Emitter<LabelActionsStates>emit)async {
    emit(AddLabelLoadingState());
    String name=event.label.trim();
    Label label=Label(name:name);
    await _dataSource.addLabel(label);
    labels.insert(0,label);
    emit(AddLabelSuccessState());
  }
  Future<void> deleteLabel(DeleteLabelEvent event, Emitter<LabelActionsStates>emit)async {
    emit(DeleteLabelLoadingState());
    await _dataSource.deleteLabel(event.label);
    labels.remove(event.label);
    emit(DeleteLabelSuccessState());
  }
  bool checkFound(String name){
    bool found=false;
    for (Label element in labels)
    {
      if(element.name==name)
      {
        found=true;
        break;
      }
    }
    return found;
  }
  Future<void> getLabels(GetLabelsEvent event, Emitter<LabelActionsStates>emit) async{
    labels=_dataSource.getLabel();
    emit(GetLabelsState());
  }
}