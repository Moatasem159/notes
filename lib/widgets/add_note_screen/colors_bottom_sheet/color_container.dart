part of'colors_bottom_sheet.dart';
class _ColorContainer extends StatelessWidget {
  final int index;
  const _ColorContainer(this.index);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorsBottomSheetCubit, ColorsBottomSheetStates>(
      builder: (context, state) {
        ColorsBottomSheetCubit cubit = ColorsBottomSheetCubit.of(context);
        return GestureDetector(
          onTap: () {
            cubit.chooseColor(index);
            AddNoteCubit.of(context).changeColor(ColorsBottomSheetCubit.of(context).colors[index].value);
          },
          child: Container(
            height: context.height/13.38181818181818,
            width:context.width/6.545454545454545,
            margin: const EdgeInsets.symmetric(horizontal: 7),
            decoration: BoxDecoration(
                color: cubit.colors[index] == Colors.transparent
                    ? context.scaffoldBackground
                    : cubit.colors[index],
                shape: BoxShape.circle,
                border: cubit.colors[index] == Colors.transparent ?
                    Border.all(color: !cubit.chosen[index] ? Colors.white : Colors.transparent) : null),
            child: cubit.chosen[index]
                ? const _ChosenColorWidget()
                : (cubit.colors[index] == Colors.transparent && !cubit.chosen[index])
                    ? const Icon(Icons.format_color_reset_outlined)
                    : null,
          ),
        );
      },
    );
  }
}