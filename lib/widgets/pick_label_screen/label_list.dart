part of 'pick_label_list.dart';
class _LabelsList extends StatelessWidget {
  const _LabelsList();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PickLabelsCubit, PickLabelsStates>(
      builder: (context, state) {
        if (state is GetLabelsSuccessState) {
          return SliverList.builder(
            key: GlobalKey(),
            itemCount: state.labels.length,
            itemBuilder: (context, index) {
              PickLabelsCubit cubit = PickLabelsCubit.of(context);
              return CustomCheckListTile(
                title: state.labels[index].name,
                checkType: state.labels[index].checkType,
                onChanged: (checkType) {
                  if (checkType == CheckType.all) {
                    Label label = cubit.labels.firstWhere((Label element) => element.name == state.labels[index].name,
                        orElse: () => Label(name: ""));
                    if (cubit.labels.isNotEmpty) {
                      cubit.labels.remove(label);
                    }
                    cubit.labels.add(Label(name: state.labels[index].name,checkType: CheckType.all));
                  } else if (!cubit.inNote && checkType == CheckType.none) {
                    cubit.labels.firstWhere((Label element) => element.name == state.labels[index].name)
                        .checkType = CheckType.none;
                  } else if (cubit.inNote && checkType == CheckType.none) {
                    Label label = cubit.labels.firstWhere((Label element) =>
                        element.name == state.labels[index].name);
                    cubit.labels.remove(label);
                  }
                },
              );
            },
          );
        }
        return const SliverToBoxAdapter();
      },
    );
  }
}
