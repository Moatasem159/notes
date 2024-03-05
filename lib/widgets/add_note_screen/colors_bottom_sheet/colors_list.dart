part of'colors_bottom_sheet.dart';
class _ColorsList extends StatelessWidget {
  const _ColorsList();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height/9.2,
      child: ListView.builder(
        itemCount: ColorsBottomSheetCubit.of(context).colors.length,
        padding: const EdgeInsets.symmetric(horizontal: 5),
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) => _ColorContainer(index)),
    );
  }
}