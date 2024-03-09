import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/models/label.dart';
import 'package:notes/models/note.dart';
import 'package:notes/sources/labels_data_source.dart';
part 'get_labels_state.dart';
class GetLabelsCubit extends Cubit<GetLabelsStates> {
  final LabelLocalDataSource _dataSource;
  GetLabelsCubit(this._dataSource) : super(GetLabelsInitialState());
  static GetLabelsCubit of(BuildContext context)=>BlocProvider.of(context);
  late List<Label> labels;
  late List<Label> markedLabels;
  late List<Label> semiMarkedLabels;
   getLabels(){
     labels=_dataSource.getLabel();
     emit(GetLabelsSuccessState());
  }

  getMarkedLabeled(List<Note> notes){
     // for(Note note in notes)
     //   {
     //     for (Label label in labels) {
     //       if (note.labels.contains(label)) {
     //         if (!semiMarkedLabels.contains(label)) {
     //           semiMarkedLabels.add(label);
     //         }
     //       }
     //     }
     //   }
     // if(semiMarkedLabels.length==labels.length)
     //   {
     //     markedLabels.addAll(semiMarkedLabels);
     //     semiMarkedLabels.clear();
     //   }
     // else{
     //   for (Label label in labels) {
     //
     //   }
     // }
  }
}
