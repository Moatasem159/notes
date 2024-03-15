part of'home_screen_body.dart';
class _DefaultHomeAppbar extends StatelessWidget {
  const _DefaultHomeAppbar();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.only(top: 45, left: 15, right: 15, bottom: 0),
      child: Material(
        color: context.theme.colorScheme.onSecondary,
        borderRadius: BorderRadius.circular(25),
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(25),
          child: SizedBox(
            child: Row(
              children: [
                CustomIconButton(
                    icon: const Icon(Icons.menu_rounded),
                    onTap: Scaffold.of(context).openDrawer),
                Text(context.local.searchMsg,
                    style: AppStyles.styleRegular20(context)),
                const Spacer(),
                const SwitchListViewButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}