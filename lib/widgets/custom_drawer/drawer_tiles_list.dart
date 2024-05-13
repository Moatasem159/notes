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
            if (context.route.name != Routes.homeRoute) {
              Scaffold.of(context).closeDrawer();
              context.pushReplacementNamed(Routes.homeRoute);
            }
            else {
              Scaffold.of(context).closeDrawer();
            }
          },
        ),
        // _DrawerTile(
        //   item: DrawerItemModel(
        //     title: context.local.reminder,
        //     icon: Icons.notifications_none_outlined,
        //     location: Routes.reminderRoute,
        //   ),
        //   onTap: () {
        //     if (context.route.name!= Routes.reminderRoute) {
        //       Scaffold.of(context).closeDrawer();
        //       context.pushReplacementNamed(Routes.reminderRoute);
        //     }
        //     else {
        //       Scaffold.of(context).closeDrawer();
        //     }
        //   },
        // ),
        const _LabelsTile(),
        _DrawerTile(
          item: DrawerItemModel(
            title: context.local.archive,
            icon: Icons.archive_outlined,
            location: Routes.archivedRoute,
          ),
          onTap: () {
            if (context.route.name!= Routes.archivedRoute) {
              Scaffold.of(context).closeDrawer();
            context.pushReplacementNamed(Routes.archivedRoute);
            }
            else {
              Scaffold.of(context).closeDrawer();
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
            if (context.route.name!= Routes.deletedRoute) {
              Scaffold.of(context).closeDrawer();
            context.pushReplacementNamed(Routes.deletedRoute);
            } else {
              Scaffold.of(context).closeDrawer();
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
            if (context.route.name!= Routes.settingsRoute) {
              Scaffold.of(context).closeDrawer();
              context.pushNamed(Routes.settingsRoute);
            } else {
              Scaffold.of(context).closeDrawer();
            }
          },
        ),
        30.ph
      ],
    );
  }
}