import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/core/extension/empty_padding_extension.dart';
import 'package:notes/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes/cubits/colors_bottom_sheet_cubit/colors_bottom_sheet_cubit.dart';
import 'package:notes/widgets/color_circle/color_circle.dart';
part 'color_container.dart';
part 'colors_list.dart';
class ColorsBottomSheet extends StatelessWidget {
  const ColorsBottomSheet({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ColorsBottomSheetCubit(value: AddNoteCubit.of(context).note!.color),
      child: BlocBuilder<AddNoteCubit, AddNoteStates>(
        builder: (context, state) {
          return Container(
            color: AddNoteCubit.of(context).note!.color == Colors.transparent.value
                ? Theme.of(context).colorScheme.background
                : Color(AddNoteCubit.of(context).note!.color),
            height: context.height/5.257142857142857,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                  child: Text(context.local.color, style: Theme.of(context).textTheme.titleLarge),
                ),
                const _ColorsList(),
                10.ph,
              ],
            ),
          );
        },
      ),
    );
  }
}