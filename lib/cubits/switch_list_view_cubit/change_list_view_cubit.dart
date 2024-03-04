import 'package:hydrated_bloc/hydrated_bloc.dart';
class SwitchListViewCubit extends HydratedCubit<ListViewType> {
  SwitchListViewCubit() : super(ListViewType.grid);
  _getListView() {
    emit(ListViewType.normal);
  }
  _getGridView() {
    emit(ListViewType.grid);
  }
  changeView() {
    if (state == ListViewType.grid) {
      _getListView();
    } else {
      _getGridView();
    }
  }
  @override
  ListViewType? fromJson(Map<String, dynamic> json) {
    return json["ListViewType"] == "grid" ? ListViewType.grid: ListViewType.normal;
  }
  @override
  Map<String, dynamic>? toJson(ListViewType state) {
    return state == ListViewType.grid ? {"ListViewType": "grid"} : {"ListViewType": "normal"};
  }
}
enum ListViewType {normal,grid}