import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/cubits/pick_labels_cubit/pick_labels_cubit.dart';
class PickLabelAppbar extends StatelessWidget implements PreferredSizeWidget {
  const PickLabelAppbar({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocListener<PickLabelsCubit, PickLabelsStates>(
      listener: PickLabelsCubit.of(context).appbarListener,
      child: AppBar(
        titleSpacing: 0,
        title: TextFormField(
          controller: PickLabelsCubit.of(context).controller,
          decoration: InputDecoration(
            hintText: context.local.enterLabelName
          ),
        ),
      ),
    );
  }
  @override
  Size get preferredSize => const Size(double.infinity, 60);
}
