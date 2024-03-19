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
      listener: GetLabelsCubit.of(context).appbarListener,
      child: AppBar(
        leading: CustomIconButton(
            onTap:(){
              if(!GetLabelsCubit.of(context).inNote) {
                GetLabelsCubit.of(context).pickLabelsForMultipleNotes();
              }
              else{
                GetLabelsCubit.of(context).picLabelsForNote();
              }
              context.pop();
            },
            icon: const Icon(Icons.arrow_back)),
      ),
    );
  }
  @override
  Size get preferredSize => const Size(double.infinity, 60);
}
