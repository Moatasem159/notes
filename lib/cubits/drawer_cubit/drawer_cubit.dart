import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/models/label.dart';
import 'package:notes/sources/labels_data_source.dart';
part 'drawer_state.dart';
class DrawerCubit extends Cubit<DrawerStates> {
  final LabelLocalDataSource _dataSource;
  DrawerCubit(this._dataSource) : super(const EmptyLabelsState());
  getLabels() {
    List<Label> allLabels = _dataSource.getLabel();
    if (allLabels.isNotEmpty) {
      emit(GetLabelsSuccessState(allLabels));
    } else {
      emit(const EmptyLabelsState());
    }
  }
}