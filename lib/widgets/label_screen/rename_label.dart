part of 'label_screen_body.dart';
class _RenameLabelDialog extends StatelessWidget {
  const _RenameLabelDialog();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: context.theme.colorScheme.onSecondary,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)),
      contentPadding:
      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      actionsPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(context.local.renameLabel,
              style: AppStyles.styleSemiBold24(context)),
          5.ph,
          TextFormField(
            initialValue: GetLabeledNotesCubit.of(context).label,
            decoration: const InputDecoration(
                isDense: true, border: OutlineInputBorder()),
          )
        ],
      ),
      actions: [
        CustomButton(
          title: context.local.cancel,
          onTap: () {},
          foregroundColor:context.theme.elevatedButtonTheme.style!.backgroundColor,
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
        ),
        CustomButton(
          title: context.local.rename,
          onTap: () {},
          backgroundColor: context.theme.elevatedButtonTheme.style!.backgroundColor,
        ),
      ],
    );
  }
}