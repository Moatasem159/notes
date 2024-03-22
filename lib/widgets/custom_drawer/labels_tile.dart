part of'main_drawer.dart';
class _LabelsTile extends StatelessWidget {
  const _LabelsTile();
  @override
  Widget build(BuildContext context) {
    DrawerItemModel createLabelItem=DrawerItemModel(
      title: context.local.createNewLabel,
      icon: Icons.add,
      location: Routes.createLabelRoute,
    );
    onTap() {
      if (context.route.name!= Routes.createLabelRoute) {
        Scaffold.of(context).closeDrawer();
        context.pushNamed(Routes.createLabelRoute,arguments: true);
      } else {
        Scaffold.of(context).closeDrawer();
      }
    }
    return BlocBuilder<GetLabelsCubit, GetLabelsStates>(
      builder: (context, state) {
        if (state is GetLabelsSuccessState && GetLabelsCubit.of(context).allLabels.isNotEmpty){
          return _LabelsList(labels: GetLabelsCubit.of(context).allLabels,item: createLabelItem,onTap:onTap);
        }
        return _DrawerTile(item: createLabelItem,onTap: onTap);
      },
    );
  }
}