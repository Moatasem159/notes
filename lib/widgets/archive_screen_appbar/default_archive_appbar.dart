part of'archive_appbar.dart';
class _DefaultArchiveAppbar extends StatelessWidget {
  const _DefaultArchiveAppbar();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomIconButton(icon: const Icon(Icons.menu_rounded),onTap: Scaffold.of(context).openDrawer),
        Text(context.local.archive,style: AppStyles.styleRegular24(context)),
        const Spacer(),
        CustomIconButton(onTap: (){}, icon: const Icon(Icons.search)),
        const SwitchListViewButton(),
      ],
    );
  }
}