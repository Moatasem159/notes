import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/cubits/get_labels_cubit/get_labels_cubit.dart';
import 'package:notes/widgets/custom_icon_button.dart';
class PickLabelAppbar extends StatelessWidget implements PreferredSizeWidget {
  const PickLabelAppbar({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocListener<GetLabelsCubit, GetLabelsStates>(
      listener: GetLabelsCubit.of(context).appbarListener,
      child: AppBar(
        leading: CustomIconButton(
            onTap:(){

              context.pop();
            },
            icon: const Icon(Icons.arrow_back)),
      ),
    );
  }
  @override
  Size get preferredSize => const Size(double.infinity, 60);
}
