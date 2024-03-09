import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubits/create_label_cubit/create_label_cubit.dart';
import 'package:notes/widgets/create_label_screen/edit_label_field.dart';
class LabelsList extends StatelessWidget {
  const LabelsList({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateLabelCubit, CreateLabelStates>(
      builder: (context, state) {
        CreateLabelCubit cubit = CreateLabelCubit.of(context);
        return SliverList.builder(
          itemCount: cubit.labels.length,
          itemBuilder: (_, index) => EditLabelField(
            controller: TextEditingController(text: cubit.labels[index].name),
            label: cubit.labels[index],
            index: index,
          ),
        );
      },
    );
  }
}