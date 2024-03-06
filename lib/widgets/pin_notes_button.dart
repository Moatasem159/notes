import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubits/app_bar_cubit/app_bar_cubit.dart';
import 'package:notes/cubits/get_active_notes_cubit/get_active_notes_cubit.dart';
import 'package:notes/widgets/custom_icon_button.dart';
class PinNotesButton extends StatelessWidget {
  const PinNotesButton({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBarCubit, AppBarStates>(
      listener: (context, state) {
        if(state is PinNotesSuccessState)
        {
          GetActiveNotesCubit.of(context).getNotes();
        }
      },
      builder: (context, state) {
        return CustomIconButton(
            onTap: AppBarCubit.of(context).pinNotes,
            icon: AppBarCubit.of(context).isPinned ?Icons.push_pin_rounded:Icons.push_pin_outlined);
      },
    );
  }
}