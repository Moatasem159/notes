part of 'colors_bottom_sheet.dart';
class _ColorContainer extends StatelessWidget {
  final int index;
  const _ColorContainer(this.index);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorsBottomSheetCubit, ColorsBottomSheetStates>(
      builder: (context, state) {
        ColorsBottomSheetCubit cubit = ColorsBottomSheetCubit.of(context);
        return ColorCircle(
            onTap: (){
              cubit.chooseColor(index);
              AddNoteCubit.of(context).changeColor(
                  ColorsBottomSheetCubit.of(context).colors[index].value);
            },
            color: cubit.colors[index].value,
            isSelected: cubit.chosen[index],
        );
      },
    );
  }
}


