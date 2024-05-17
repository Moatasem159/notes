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
        return SliverAnimatedList(
          key: cubit.listKey,
          initialItemCount: cubit.labels.length,
          itemBuilder: (context, index, animation) => EditLabelField(
            key: ValueKey<String>(cubit.labels[index].name),
            animation: animation,
            index: index,
            label: cubit.labels[index],
          ),
        );
      },
    );
  }
}
