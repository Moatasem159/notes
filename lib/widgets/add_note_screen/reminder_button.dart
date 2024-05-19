import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes/widgets/custom_icon_button.dart';
import 'package:notes/widgets/set_reminder_dialog/reminder_dialog.dart';
class ReminderButton extends StatelessWidget {
  const ReminderButton({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
      onTap: () {
        showAdaptiveDialog(
          context: context,
          builder: (_) => BlocProvider.value(
            value: AddNoteCubit.of(context),
            child: const SetReminderDialog(inNote: true),
          ),
        );
      },
      icon: const Icon(Icons.notification_add_outlined),
      tooltip: context.local.reminder,
    );
  }
}