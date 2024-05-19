import 'package:flutter/material.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/core/extension/date_extension.dart';
import 'package:notes/core/utils/app_text_styles.dart';
import 'package:notes/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes/widgets/custom_button.dart';
part 'reminder_list_tile.dart';
class SetReminderDialog extends StatefulWidget {
  final bool inNote;
  const SetReminderDialog({super.key,this.inNote=false});
  @override
  State<SetReminderDialog> createState() => _SetReminderDialogState();
}
class _SetReminderDialogState extends State<SetReminderDialog> {
  String? date=DateTime.now().formatDate();
  String? time=TimeOfDay.now().getInitialTime();
  @override
  void initState() {
    date=DateTime.now().formatDate();
    time=TimeOfDay.now().getInitialTime();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      AddNoteCubit.of(context).note!.reminderDate=date!;
      AddNoteCubit.of(context).note!.reminderTime=time!;
    },);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      contentPadding: EdgeInsets.zero,
      titlePadding: const EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 5),
      title: Text(context.local.addReminder, style: AppStyles.styleRegular24(context)),
      actionsPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _ReminderListTile(
            onTap: () {
              showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime(2040, 31, 12),
              ).then(
                (DateTime? value) {
                  setState(() {
                    date=value!.formatDate();
                    AddNoteCubit.of(context).note!.reminderDate=date!;
                  });
                },
              );
            },
            title: context.local.pickDate,
            subTitle: date,
            icon: Icons.calendar_month_rounded,
          ),
          _ReminderListTile(
            onTap: () {
              showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              ).then((TimeOfDay? value) {
                setState(() {
                    time=value?.formatTime()??TimeOfDay.now().getInitialTime();
                  });
                AddNoteCubit.of(context).note!.reminderTime=time!;
              },
              );
            },
            title: context.local.pickTime,
            subTitle: time,
            icon: Icons.access_time_rounded,
          ),
        ],
      ),
      actions: [
        CustomButton(
            onTap: () {
              AddNoteCubit.of(context).note!.reminderDate='';
              AddNoteCubit.of(context).note!.reminderTime='';
              AddNoteCubit.of(context).setReminder();
              context.pop();
            },
            padding: const WidgetStatePropertyAll(EdgeInsets.zero),
            foregroundColor: WidgetStatePropertyAll(
              context.theme.iconTheme.color,
            ),
            backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
            title: context.local.cancel),
        CustomButton(
          onTap: () {
            AddNoteCubit.of(context).setReminder();
            context.pop();
          },
            padding: const WidgetStatePropertyAll(
                EdgeInsets.symmetric(horizontal: 20)),
            foregroundColor:
                WidgetStatePropertyAll(context.theme.iconTheme.color),
            title: context.local.save,
            backgroundColor:
                WidgetStatePropertyAll(context.theme.dividerTheme.color)),
      ],
    );
  }
}