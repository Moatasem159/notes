import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubits/get_labels_cubit/get_labels_cubit.dart';
import 'package:notes/models/label.dart';
import 'package:notes/widgets/pick_label_screen/custom_check_list_tile.dart';
class PickLabelsList extends StatelessWidget {
  const PickLabelsList({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetLabelsCubit, GetLabelsStates>(
      builder: (context, state) {
        GetLabelsCubit cubit = GetLabelsCubit.of(context);
        if (state is GetLabelsSuccessState && cubit.allLabels.isNotEmpty) {
          return ListView.builder(
            itemCount: GetLabelsCubit.of(context).allLabels.length,
            itemBuilder: (context, index) {
              Label label = cubit.allLabels[index];
              Label tempLabel = cubit.labels!.firstWhere((element) => element.name == label.name, orElse: () => Label(name: ""));
              return CustomCheckListTile(
                checkType: tempLabel.checkType,
                title: GetLabelsCubit.of(context).allLabels[index].name,
                onChanged: (checkType){
                  if (checkType==CheckType.all) {
                    cubit.labels!.add(Label(name: cubit.allLabels[index].name, checkType: CheckType.all));
                  } else if(checkType==CheckType.none) {
                    cubit.labels!.firstWhere((element) => element.name == cubit.allLabels[index].name).checkType=CheckType.none;
                  }
                },
              );
            },
          );
        }
        return const SizedBox();
      },
    );
  }
}
