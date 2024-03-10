import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:notes/cubits/get_labels_cubit/get_labels_cubit.dart';
import 'package:notes/widgets/custom_icon_button.dart';

class PickLabelAppbar extends StatelessWidget implements PreferredSizeWidget {
  const PickLabelAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<GetLabelsCubit, GetLabelsStates>(
      listener: (context, state) {
        if (state is PickLabelsSuccessState) {
          context.pop();
        }
      },
      child: AppBar(
        leading: CustomIconButton(
            onTap: GetLabelsCubit.of(context).pickLabels,
            icon: const Icon(Icons.arrow_back)),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 60);
}
