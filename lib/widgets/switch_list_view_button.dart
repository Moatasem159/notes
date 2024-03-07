import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubits/switch_list_view_cubit/change_list_view_cubit.dart';
import 'package:notes/widgets/custom_icon_button.dart';
class SwitchListViewButton extends StatelessWidget {
  const SwitchListViewButton({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SwitchListViewCubit, ListViewType>(
      builder: (context, state) {
        return CustomIconButton(
            icon: Icon(state==ListViewType.normal ? Icons.grid_view_rounded:Icons.view_agenda_outlined),
            onTap: SwitchListViewCubit.of(context).changeView);
      },
    );
  }
}