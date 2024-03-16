part of 'deleted_screen_body.dart';
class _DefaultDeletedAppbar extends StatelessWidget {
  const _DefaultDeletedAppbar();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomIconButton(icon: const Icon(Icons.menu_rounded), onTap: Scaffold.of(context).openDrawer),
        Text(context.local.deleted, style: AppStyles.styleRegular24(context)),
        const Spacer(),
        const _DeletePopUpMenu()
      ],
    );
  }
}
