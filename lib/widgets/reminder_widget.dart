import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/core/extension/date_extension.dart';
import 'package:notes/core/extension/empty_padding_extension.dart';
import 'package:notes/core/utils/app_text_styles.dart';
import 'package:notes/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes/widgets/set_reminder_dialog/reminder_dialog.dart';
class ReminderWidget extends StatelessWidget {
  final bool tapped;
  final DateTime date;
  final TimeOfDay time;
  const ReminderWidget({super.key,required this.tapped,required this.date,required this.time});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tapped
          ? () {
              showAdaptiveDialog(
                context: context,
                builder: (_) {
                  return BlocProvider.value(
                      value: AddNoteCubit.of(context),
                      child: const SetReminderDialog(inNote: true));
                },
              );
            }
          : null,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
        constraints: const BoxConstraints(maxWidth: 260, minWidth: 30),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.4),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.alarm_outlined,
              size: tapped ? 25 : 18,
              color: Colors.grey[400],
            ),
            4.pw,
            Text.rich(
              TextSpan(
                  text: date.checkDay().$1
                      ? "${context.local.today}, "
                      : date.checkDay().$2
                          ? "${context.local.tomorrow}, "
                          : "${date.formatDate()}, ",
                  children: [
                    TextSpan(
                      text:time.formatTime(),
                    )
                  ]),
              style: tapped
                  ? AppStyles.styleRegular20(context)
                      .copyWith(color: Colors.grey[400])
                  : AppStyles.styleRegular16(context)
                      .copyWith(color: Colors.grey[400]),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
