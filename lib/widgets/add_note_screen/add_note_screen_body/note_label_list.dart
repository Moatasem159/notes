import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes/widgets/label_widget.dart';
class NoteLabelList extends StatelessWidget {
  const NoteLabelList({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddNoteCubit, AddNoteStates>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(left: 10,right: 10,bottom: 40),
          child: Wrap(
            spacing: 10,
              runSpacing: 10,
              children: AddNoteCubit.of(context)
                  .note!
                  .labels
                  .map((e) => LabelWidget(label: e,tapped: true))
                  .toList()),
        );
      },
    );
  }
}

