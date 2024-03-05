import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'colors_bottom_sheet_state.dart';
class ColorsBottomSheetCubit extends Cubit<ColorsBottomSheetStates> {
  ColorsBottomSheetCubit({required this.value}) : super(BottomSheetInitialState()){
    colors=[
      Colors.transparent,
      const Color(0xffA61D2E),
      const Color(0xff623F1B),
      const Color(0xff8d8f27),
      const Color(0xff207838),
      const Color(0xff2e2a6e),
      const Color(0xff514c8c),
      const Color(0xff571d46),
      const Color(0xff7a203a),
      const Color(0xff166959),
    ];
    chosen=[
      true,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false
    ];
    initializeColor(value);
  }
  static ColorsBottomSheetCubit of(BuildContext context)=>BlocProvider.of(context);
  late final List<Color> colors;
  late List<bool> chosen;
  final int value;
  chooseColor(int index){
   for(int i=0;i<chosen.length;i++){
     chosen[i] = false;
   }
    chosen[index]=true;
    emit(ChooseColorSuccessState());
  }
  initializeColor(int ?value){
    if(value!=null){
      int index=0;
      for (int i=0;i<colors.length;i++){
        if(colors[i].value==value){
          index = i;
          break;
        }
      }
      chooseColor(index);
    }
  }
  @override
  Future<void> close() {
    colors.clear();
    chosen.clear();
    return super.close();
  }
}
