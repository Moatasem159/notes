part of'pick_label_list.dart';
class _LabelsList extends StatelessWidget {
  final bool inNote;
  final List<Label>labels;
  const _LabelsList(this.inNote,this.labels);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: GlobalKey(),
      itemCount: PickLabelsCubit.of(context).filteredLabels.length,
      itemBuilder: (context, index,) {
        return CustomCheckListTile(
          title: PickLabelsCubit.of(context).filteredLabels[index].name,
          checkType: PickLabelsCubit.of(context).filteredLabels[index].checkType,
          onChanged: (checkType) {
            PickLabelsCubit cubit=PickLabelsCubit.of(context);
            if (checkType == CheckType.all) {
              Label label = cubit.labels!.firstWhere((element) => element.name == labels[index].name, orElse: () => Label(name: ""));
              if (cubit.labels!.isNotEmpty) {
                cubit.labels!.remove(label);
              }
              cubit.labels!.add(Label(name: labels[index].name,checkType: CheckType.all));
            }
            else if (!inNote && checkType == CheckType.none) {
              cubit.labels!.firstWhere((element) => element.name == labels[index].name).checkType = CheckType.none;
            }
            else if (inNote && checkType == CheckType.none){
              Label label = cubit.labels!.firstWhere((element) => element.name == labels[index].name);
              cubit.labels!.remove(label);
            }
          },
        );
      },
    );
  }
}