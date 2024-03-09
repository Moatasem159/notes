import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubits/get_labels_cubit/get_labels_cubit.dart';
import 'package:notes/models/label.dart';
import 'package:notes/models/note.dart';
import 'package:notes/widgets/custom_check_button.dart';
import 'package:notes/widgets/pick_label_screen/custom_check_list_tile.dart';

class PickLabelsList extends StatelessWidget {
  const PickLabelsList({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetLabelsCubit, GetLabelsStates>(
      builder: (context, state) {
       if(state is GetLabelsSuccessState &&GetLabelsCubit.of(context).labels.isNotEmpty)
         {
           return ListView.builder(
             itemCount: GetLabelsCubit.of(context).labels.length,
             itemBuilder: (context, index) => CustomCheckListTile(
               checkType: CheckType.all,
               title: GetLabelsCubit.of(context).labels[index].name,
               onChanged:(p0) {},
               isChecked: false,
             ),
           );
         }
       return const SizedBox();
      },
    );
  }
}