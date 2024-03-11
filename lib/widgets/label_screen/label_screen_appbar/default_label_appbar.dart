part of'label_appbar.dart';
class _DefaultLabelAppbar extends StatelessWidget {
  final String title;
  const _DefaultLabelAppbar(this.title);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomIconButton(icon: const Icon(Icons.menu_rounded),onTap: Scaffold.of(context).openDrawer),
        Text(title,style: AppStyles.styleRegular24(context)),
        const Spacer(),
        CustomIconButton(onTap: (){}, icon: const Icon(Icons.search)),
        const SwitchListViewButton(),
        const _LabelPopupMenu()
      ],
    );
  }
}

