import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes/widgets/add_note_screen/bottom_bar/base_bottom_bar.dart';
class AddNoteBottomNavBar extends StatelessWidget {
  const AddNoteBottomNavBar({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddNoteCubit, AddNoteStates>(
      builder: (context, state) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Container(
            color: AddNoteCubit.of(context).note!.color==Colors.transparent.value
                ? context.scaffoldBackground
                : Color(AddNoteCubit.of(context).note!.color),
            width: context.width,
            height: 45,
            child:const BaseBottomBar(),
          ),
        );
      },
    );
  }
}