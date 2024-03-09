import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/models/label.dart';
import 'package:notes/sources/labels_data_source.dart';
part 'get_labels_state.dart';
class GetLabelsCubit extends Cubit<GetLabelsStates> {
  final LabelLocalDataSource _dataSource;
  GetLabelsCubit(this._dataSource) : super(GetLabelsInitialState());
  static GetLabelsCubit of(BuildContext context)=>BlocProvider.of(context);
   getLabels(){
     List<Label> label=[];
     label=_dataSource.getLabel();
     emit(GetLabelsSuccessState(label));
  }
}