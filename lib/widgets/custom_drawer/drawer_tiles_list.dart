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
        location: Routes.createLabelRoute,
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
    } else if (e.location == Routes.createLabelRoute) {
      context.pop();
      context.pushNamed(e.location, queryParameters: {"isNew": "true"});
    } else if (AppRoute.location() != e.location) {
      context.pop();
      context.goNamed(e.location);
    } else {
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      _DrawerTile(item: drawerItems[0], onTap: () => onTap(drawerItems[0])),
      _DrawerTile(item: drawerItems[1], onTap: () => onTap(drawerItems[1])),
       BlocBuilder<GetLabelsCubit, GetLabelsStates>(
        builder: (context, state) {
          if(state is GetLabelsSuccessState && state.labels.isNotEmpty) {
           return _LabelsList(labels: state.labels,item: drawerItems[2], onTap: () => onTap(drawerItems[2]));
          }
          return _DrawerTile(item: drawerItems[2], onTap: () => onTap(drawerItems[2]));
        },
      ),
      _DrawerTile(item: drawerItems[3], onTap: () => onTap(drawerItems[3])),
      _DrawerTile(item: drawerItems[4], onTap: () => onTap(drawerItems[4])),
      _DrawerTile(item: drawerItems[5], onTap: () => onTap(drawerItems[5])),
      30.ph
    ]);
  }
}
