part of 'label_screen_body.dart';

class _LabelPopupMenu extends StatelessWidget {
  const _LabelPopupMenu();

  @override
  Widget build(BuildContext context) {
    return CustomPopupMenu(
      items: [
        PopupMenuItem(
          onTap: () {
            showDialog(
              context: context,
              builder: (_) {
                return BlocProvider.value(
                  value: GetLabeledNotesCubit.of(context),
                  child: const _RenameLabelDialog(),
                );
              },
            );
          },
          child: CustomPopUpMenuItem(title: context.local.renameLabel),
        ),
        PopupMenuItem(
          onTap: () {},
          child: CustomPopUpMenuItem(title: context.local.deleteLabel),
        ),
      ],
    );
  }
}




