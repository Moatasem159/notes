import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/core/utils/app_text_styles.dart';
import 'package:notes/cubits/label_actions_bloc/label_actions_bloc.dart';
import 'package:notes/widgets/custom_button.dart';

class DeleteDialog extends StatelessWidget {
  final VoidCallback delete;
  const DeleteDialog({super.key, required this.delete});
  @override
  Widget build(BuildContext context) {
    return BlocListener<LabelActionsBloc, LabelActionsStates>(
      listener: (context, state) {},
      child: AlertDialog(
        title: Text(context.local.deleteLabel,style: AppStyles.styleSemiBold24(context)),
        titlePadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        actionsPadding: EdgeInsets.zero,
        content: Text(context.local.deleteLabelDialog,style: AppStyles.styleRegular16(context)),
        actions: [
          CustomButton(
            title: context.local.cancel,
            onTap: context.pop,
            padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 5)),
            foregroundColor: context.theme.elevatedButtonTheme.style!.backgroundColor,
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
          ),
          CustomButton(
              title: context.local.delete,
              onTap: delete,
              padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 20)),
              foregroundColor: context.theme.elevatedButtonTheme.style!.backgroundColor,
              backgroundColor:MaterialStateProperty.all(Colors.transparent)),
        ],
      ),
    );
  }
}