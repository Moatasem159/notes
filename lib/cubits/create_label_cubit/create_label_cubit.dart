import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/models/label.dart';
import 'package:notes/sources/labels_data_source.dart';
part 'create_label_state.dart';
class CreateLabelCubit extends Cubit<CreateLabelStates> {
  CreateLabelCubit(this._dataSource) : super(CreateLabelInitialState());
  final LabelLocalDataSource _dataSource;
  static CreateLabelCubit of(BuildContext context)=>BlocProvider.of(context);
  late List<Label> labels;
  Future<void> addLabel(String name)async {
    emit(AddLabelLoadingState());
    name.trimLeft();
    name.trimRight();
    Label label=Label(name:name);
    await _dataSource.addLabel(label);
    labels.insert(0,label);
    emit(AddLabelSuccessState());
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
  Future<void> editLabel(Label label,String text)async {
    emit(AddLabelLoadingState());
    Label temp=Label(name: '');
    temp.name=text;
    bool found=labels.contains(temp);
    if(!found)
      {
        label.name=text;
        label.save();
        emit(EditLabelSuccessState());
      }
    else{
      emit(AddLabelErrorState());
    }
  }
  Future<void> deleteLabel(Label label, int index)async {
    emit(AddLabelLoadingState());
    label.delete();
    labels.removeAt(index);
    emit(DeleteLabelSuccessState());
  }
  Future<void> getLabels()async{
    labels=_dataSource.getLabel();
    emit(GetLabelsState());
  }
}