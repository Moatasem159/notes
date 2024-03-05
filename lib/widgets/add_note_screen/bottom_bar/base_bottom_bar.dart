import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/core/extension/empty_padding_extension.dart';
import 'package:notes/core/functions/format_date.dart';
import 'package:notes/core/utils/app_text_styles.dart';
import 'package:notes/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes/widgets/add_note_screen/add_bottom_sheet/add_bottom_sheet.dart';
import 'package:notes/widgets/add_note_screen/colors_bottom_sheet/colors_bottom_sheet.dart';
import 'package:notes/widgets/custom_icon_button.dart';
class BaseBottomBar extends StatelessWidget {
  const BaseBottomBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomIconButton(onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (_) {
              return BlocProvider.value(
                value: AddNoteCubit.of(context),
                child: const AddBottomSheet(),
              );
            },
          );
        }, icon: Icons.add_box_outlined),
        CustomIconButton(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (_) {
                  return BlocProvider.value(
                    value:AddNoteCubit.of(context),
                    child: const ColorsBottomSheet(),
                  );
                },
              );
            },
            icon: Icons.color_lens_outlined),
        5.pw,
        Text(
          "${context.local.edited} ${formatCustomDate(AddNoteCubit.of(context).note!.date)}",
          style: AppStyles.styleMedium16(context).copyWith(color: Colors.grey),
        ),
        const Spacer(),
        CustomIconButton(onTap: () {}, icon: Icons.more_vert_rounded),
      ],
    );
  }
}