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
              builder: (_) => MultiBlocProvider(
                providers: [
                  BlocProvider.value(value: GetLabeledNotesCubit.of(context)),
                  BlocProvider(create: (context) => LabelActionsBloc(sl()))
                ],
                child: const _RenameLabelDialog(),
              ),
            );
          },
          child: CustomPopUpMenuItem(title: context.local.renameLabel),
        ),
        PopupMenuItem(
          onTap: () {
            showDialog(
              context: context,
              builder: (_) {
                return MultiBlocProvider(
                  providers: [
                    BlocProvider(create: (context) => LabelActionsBloc(sl())),
                    BlocProvider.value(value: GetLabeledNotesCubit.of(context)),
                  ],
                  child: const _InLabelDeleteDialog(),
                );
              },
            );
          },
          child: CustomPopUpMenuItem(title: context.local.deleteLabel),
        ),
      ],
    );
  }
}