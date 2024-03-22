part of 'main_drawer.dart';
class _DrawerTilesList extends StatelessWidget {
  const _DrawerTilesList();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _DrawerTile(
          item: DrawerItemModel(
            title: context.local.notes,
            icon: Icons.lightbulb_outline,
            location: Routes.homeRoute,
          ),
          onTap: () {
            if (AppRoute.location() != Routes.homeRoute) {
              context.pop();
              GoRouter.of(context).pushReplacementNamed(Routes.homeRoute);
            }
            else {
              context.pop();
            }
          },
        ),
        _DrawerTile(
          item: DrawerItemModel(
            title: context.local.reminder,
            icon: Icons.notifications_none_outlined,
            location: Routes.reminderRoute,
          ),
          onTap: () {
            if (AppRoute.location() != Routes.reminderRoute) {
              context.pop();
              GoRouter.of(context).pushReplacementNamed(Routes.reminderRoute);
            }
            else {
              context.pop();
            }
          },
        ),
        const _LabelsTile(),
        _DrawerTile(
          item: DrawerItemModel(
            title: context.local.archive,
            icon: Icons.archive_outlined,
            location: Routes.archivedRoute,
          ),
          onTap: () {
            if (AppRoute.location() != Routes.archivedRoute) {
              context.pop();
            context.goNamed(Routes.archivedRoute);
            }
            else {
              context.pop();
            }
          },
        ),
        _DrawerTile(
          item: DrawerItemModel(
            title: context.local.deleted,
            icon: Icons.delete_outline_rounded,
            location: Routes.deletedRoute,
          ),
          onTap: () {
            if (AppRoute.location() != Routes.deletedRoute) {
              context.pop();
            context.goNamed(Routes.deletedRoute);
            } else {
              context.pop();
            }
          },
        ),
        _DrawerTile(
          item: DrawerItemModel(
            title: context.local.settings,
            icon: Icons.settings_outlined,
            location: Routes.settingsRoute,
          ),
          onTap: () {
            if (AppRoute.location() != Routes.settingsRoute) {
              context.pop();
              context.pushNamed(Routes.settingsRoute);
            } else {
              context.pop();
            }
          },
        ),
        30.ph
      ],
    );
  }
}