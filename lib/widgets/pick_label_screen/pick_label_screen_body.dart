import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/core/utils/app_text_styles.dart';
import 'package:notes/cubits/pick_labels_cubit/pick_labels_cubit.dart';
import 'package:notes/widgets/custom_scroll_list.dart';
import 'package:notes/widgets/pick_label_screen/custom_check_list_tile.dart';
part 'label_list.dart';
part 'pick_label_appbar.dart';
part 'create_label_tile.dart';
class PickLabelsScreenBody extends StatelessWidget {
  const PickLabelsScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    return const CustomScrollList(
      slivers: [
        _PickLabelAppbar(),
        _CreateLabelTile(),
        _LabelAnimatedList(),
      ],
    );
  }
}