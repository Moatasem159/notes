part of 'label_screen_body.dart';

class _DefaultLabelAppbar extends StatelessWidget {
  const _DefaultLabelAppbar();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomIconButton(
            icon: const Icon(Icons.menu_rounded),
            onTap: Scaffold.of(context).openDrawer),
        BlocBuilder<GetLabeledNotesCubit, GetLabeledNotesStates>(
          builder: (context, state) {
            return Text(GetLabeledNotesCubit.of(context).label.name,
                style: AppStyles.styleRegular24(context));
          },
        ),
        const Spacer(),
        CustomIconButton(onTap: () {}, icon: const Icon(Icons.search)),
        const SwitchListViewButton(),
        const _LabelPopupMenu()
      ],
    );
  }
}
