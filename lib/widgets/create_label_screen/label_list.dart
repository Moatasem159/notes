import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubits/label_actions_bloc/label_actions_bloc.dart';
import 'package:notes/widgets/create_label_screen/edit_label_field.dart';
class LabelsList extends StatelessWidget {
  const LabelsList({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LabelActionsBloc, LabelActionsStates>(
      builder: (context, state) {
        LabelActionsBloc cubit = LabelActionsBloc.of(context);
        return SliverList.builder(
          itemCount: cubit.labels.length,
          itemBuilder: (_, index) => EditLabelField(
            controller: TextEditingController(text: cubit.labels[index].name),
            label: cubit.labels[index],
          ),
        );
      },
    );
  }
}