import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubits/app_bar_cubit/app_bar_cubit.dart';
import 'package:notes/cubits/get_active_notes_cubit/get_active_notes_cubit.dart';
import 'package:notes/cubits/notes_actions_bloc/notes_actions_bloc.dart';
import 'package:notes/widgets/custom_icon_button.dart';
class PinNotesButton extends StatelessWidget {
  const PinNotesButton({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocListener<NotesActionsBloc, NotesActionsState>(
      listener: (context, state) {
        if (state is ActionSuccessState) {
          AppBarCubit.of(context).removeSelection();
          GetActiveNotesCubit.of(context).getNotes();
        }
      },
     child: BlocBuilder<AppBarCubit, AppBarStates>(
       builder: (context, state) {
         return CustomIconButton(
             onTap: ()=> NotesActionsBloc.of(context).add(PinNote(AppBarCubit.of(context).selectedNotes, AppBarCubit.of(context).isPinned)),
             icon: AppBarCubit.of(context).isPinned ?Icons.push_pin_rounded:Icons.push_pin_outlined);
       },
     ),
    );
  }
}