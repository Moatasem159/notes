import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:notes/app/injection_container.dart';
import 'package:notes/config/routes/app_routes.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/cubits/app_bar_cubit/app_bar_cubit.dart';
import 'package:notes/cubits/get_active_notes_cubit/get_active_notes_cubit.dart';
import 'package:notes/cubits/get_archived_notes_cubit/get_archived_notes_cubit.dart';
import 'package:notes/cubits/notes_actions_bloc/notes_actions_bloc.dart';
import 'package:notes/models/label.dart';
import 'package:notes/models/note.dart';
import 'package:notes/models/pick_label_params.dart';
import 'package:notes/widgets/custom_popup_menu/custom_popup_menu.dart';
import 'package:notes/widgets/custom_popup_menu/custom_popup_menu_item.dart';
import 'package:notes/widgets/notes_counter.dart';
import 'package:notes/widgets/custom_icon_button.dart';
import 'package:notes/widgets/pin_notes_button.dart';

part 'default_popup_menu.dart';

class DefaultOptionsAppBar extends StatelessWidget {
  final NoteStatus noteStatus;

  const DefaultOptionsAppBar({super.key, required this.noteStatus});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesActionsBloc(sl()),
      child: Padding(
        padding: EdgeInsets.only(top: noteStatus == NoteStatus.active ? 45 : 0),
        child: Row(
          children: [
            CustomIconButton(
                onTap: AppBarCubit.of(context).removeSelection,
                icon: const Icon(Icons.clear)),
            const NotesCounter(),
            const Spacer(),
            const PinNotesButton(),
            CustomIconButton(
                onTap: () {},
                icon: const Icon(Icons.notification_add_outlined)),
            CustomIconButton(
                onTap: () {}, icon: const Icon(Icons.color_lens_outlined)),
            CustomIconButton(
                onTap: () {
                  List<Label> labels=[];
                  List<Note> notes=[];
                  labels.addAll(AppBarCubit.of(context).labels);
                  notes.addAll(AppBarCubit.of(context).selectedNotes);
                  PickLabelParams params=PickLabelParams(notes: notes, labels: labels);
                  context.pushNamed(Routes.pickLabelRoute,extra: params);
                  AppBarCubit.of(context).removeSelection(clearList: true);
                },
                icon: const Icon(Icons.label_outline_rounded)),
            _DefaultPopupMenu(noteStatus)
          ],
        ),
      ),
    );
  }
}
