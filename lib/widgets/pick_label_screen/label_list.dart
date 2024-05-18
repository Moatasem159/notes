part of 'pick_label_screen_body.dart';
class _LabelAnimatedList extends StatelessWidget {
  const _LabelAnimatedList();
  @override
  Widget build(BuildContext context) {
    return SliverAnimatedList(
      key: PickLabelsCubit.of(context).listKey,
      initialItemCount: PickLabelsCubit.of(context).filteredLabels.length,
      itemBuilder: (context, index, animation) {
        PickLabelsCubit cubit = PickLabelsCubit.of(context);
        return CustomCheckListTile(
          key: ValueKey<String>(cubit.filteredLabels[index].name),
          animation: animation,
          title: cubit.filteredLabels[index].name,
          checkType: cubit.filteredLabels[index].checkType,
          onChanged: (checkType) {
            PickLabelsCubit.of(context).chooseLabel(checkType, index);
          },
        );
      },
    );
  }
}