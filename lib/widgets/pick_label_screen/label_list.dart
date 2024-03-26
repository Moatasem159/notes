part of'pick_label_list.dart';
class _LabelsList extends StatelessWidget {
  final bool inNote;
  final List<Label>labels;
  const _LabelsList(this.inNote,this.labels);
  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      key: GlobalKey(),
      itemCount: PickLabelsCubit.of(context).filteredLabels.length,
      itemBuilder: (context, index) {
        PickLabelsCubit cubit=PickLabelsCubit.of(context);
        return CustomCheckListTile(
          title: cubit.filteredLabels[index].name,
          checkType: cubit.filteredLabels[index].checkType,
          onChanged: (checkType) {
            if (checkType == CheckType.all) {
              Label label = cubit.labels.firstWhere((element) => element.name == labels[index].name, orElse: () => Label(name: ""));
              if (cubit.labels.isNotEmpty) {
                cubit.labels.remove(label);
              }
              cubit.labels.add(Label(name: labels[index].name,checkType: CheckType.all));
            }
            else if (!inNote && checkType == CheckType.none) {
              cubit.labels.firstWhere((element) => element.name == labels[index].name).checkType = CheckType.none;
            }
            else if (inNote && checkType == CheckType.none){
              Label label = cubit.labels.firstWhere((element) => element.name == labels[index].name);
              cubit.labels.remove(label);
            }
          },
        );
      },
    );
  }
}