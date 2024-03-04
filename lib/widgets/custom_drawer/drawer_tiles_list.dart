part of 'main_drawer.dart';

class _DrawerTilesList extends StatefulWidget {
  const _DrawerTilesList();

  @override
  State<_DrawerTilesList> createState() => _DrawerTilesListState();
}

class _DrawerTilesListState extends State<_DrawerTilesList> {
  late final List<DrawerItemModel> drawerItems;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    drawerItems = [
      DrawerItemModel(
        title: context.local.notes,
        icon: Icons.lightbulb_outline,
        location: Routes.homeRoute,
      ),
      DrawerItemModel(
        title: context.local.reminder,
        icon: Icons.notifications_none_outlined,
        location: Routes.reminderRoute,
      ),
      DrawerItemModel(
        title: context.local.createNewLabel,
        icon: Icons.add,
        location: Routes.labelRoute,
      ),
      DrawerItemModel(
        title: context.local.archive,
        icon: Icons.archive_outlined,
        location: Routes.archivedRoute,
      ),
      DrawerItemModel(
        title: context.local.deleted,
        icon: Icons.delete_outline_rounded,
        location: Routes.deletedRoute,
      ),
      DrawerItemModel(
        title: context.local.settings,
        icon: Icons.settings_outlined,
        location: Routes.settingsRoute,
      ),
    ];
  }

  void onTap(DrawerItemModel e) {
    if (e.location == Routes.settingsRoute) {
      context.pop();
      context.pushNamed(e.location);
    } else if (AppRoute.location() != e.location) {
      context.pop();
      context.goNamed(e.location);
    } else {
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: drawerItems
          .map((DrawerItemModel e) =>
              _DrawerTile(item: e, onTap: () => onTap(e)))
          .toList(),
    );
  }
}
