import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/models/label.dart';
import 'package:notes/models/note.dart';
import 'package:notes/sources/labels_data_source.dart';
part 'get_labels_state.dart';
class GetLabelsCubit extends Cubit<GetLabelsStates> {
  final LabelLocalDataSource _dataSource;
  final List<Note> ?notes;
  List<Label> ?labels;
  GetLabelsCubit(this._dataSource,{this.notes,this.labels}) : super(GetLabelsInitialState());
  static GetLabelsCubit of(BuildContext context) => BlocProvider.of(context);
  late List<Label> allLabels;
  getLabels() {
    allLabels = _dataSource.getLabel();
    emit(GetLabelsSuccessState());
  }
  pickLabels()async {
    emit(PickLabelsLoadingState());
    await _dataSource.pickLabel(notes!, labels!);
    emit(PickLabelsSuccessState());
  }
  @override
  Future<void> close() {
    notes?.clear();
    labels?.clear();
    return super.close();
  }
}