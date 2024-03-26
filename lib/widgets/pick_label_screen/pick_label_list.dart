import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubits/pick_labels_cubit/pick_labels_cubit.dart';
import 'package:notes/models/label.dart';
import 'package:notes/widgets/pick_label_screen/custom_check_list_tile.dart';
part 'label_list.dart';
class PickLabelsList extends StatelessWidget {
  final bool inNote;
  const PickLabelsList({super.key, required this.inNote});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PickLabelsCubit, PickLabelsStates>(
      builder: (context, state) {
       return _LabelsList(inNote, PickLabelsCubit.of(context).filteredLabels);
      },
    );
  }
}