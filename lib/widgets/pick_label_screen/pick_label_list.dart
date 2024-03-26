import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/core/utils/app_text_styles.dart';
import 'package:notes/cubits/pick_labels_cubit/pick_labels_cubit.dart';
import 'package:notes/models/label.dart';
import 'package:notes/widgets/custom_scroll_list.dart';
import 'package:notes/widgets/pick_label_screen/custom_check_list_tile.dart';
part 'label_list.dart';
part 'create_label_tile.dart';
class PickLabelsList extends StatelessWidget {
  final bool inNote;
  const PickLabelsList({super.key, required this.inNote});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PickLabelsCubit, PickLabelsStates>(
      builder: (context, state) {
        return CustomScrollList(
          slivers: [
            if(PickLabelsCubit.of(context).notFound)
            const _CreateLabelTile(),
            if(state is GetLabelsSuccessState )
            _LabelsList(inNote, state.labels),
          ],
        );
      },
    );
  }
}