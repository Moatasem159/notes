part of 'main_drawer.dart';
class _LabelsTile extends StatelessWidget {
  const _LabelsTile();
  @override
  Widget build(BuildContext context) {
    DrawerItemModel createLabelItem = DrawerItemModel(
      title: context.local.createNewLabel,
      icon: Icons.add,
      location: Routes.createLabelRoute,
    );
    onTap() {
      if (context.route.name != Routes.createLabelRoute) {
        Scaffold.of(context).closeDrawer();
        if (context.route.name == Routes.homeRoute) {
          context.pushNamed(Routes.createLabelRoute,
              arguments: CreateLabelParams(
                  isNew: true,
                  notesStatus: NoteStatus.active,
                  notesCubit: GetActiveNotesCubit.of(context)));
        }
        else if (context.route.name == Routes.labelRoute) {
          context.pushNamed(Routes.createLabelRoute,
              arguments: CreateLabelParams(
                  isNew: true,
                  label: context.route.arguments as Label,
                  notesStatus: NoteStatus.labeled,
                  notesCubit: GetLabeledNotesCubit.of(context)));
        }
        else if (context.route.name == Routes.archivedRoute) {
          context.pushNamed(Routes.createLabelRoute,
              arguments: CreateLabelParams(
                  isNew: true,
                  notesStatus: NoteStatus.archive,
                  notesCubit: GetArchivedNotesCubit.of(context)));
        }
        else if (context.route.name == Routes.deletedRoute) {
          context.pushNamed(Routes.createLabelRoute,
              arguments: CreateLabelParams(
                  isNew: true,
                  notesStatus: NoteStatus.deleted,
                  notesCubit: GetDeletedNotesCubit.of(context)));
        }
        else{
          context.pushNamed(Routes.createLabelRoute, arguments: CreateLabelParams(isNew: true));
        }
      }
      else {
        Scaffold.of(context).closeDrawer();
      }
    }
    return BlocBuilder<DrawerCubit, DrawerStates>(
      builder: (context, state) {
        switch (state) {
          case GetLabelsSuccessState():
            return _LabelsList(labels: state.labels,item: createLabelItem,onTap: onTap);
          case EmptyLabelsState():
            return _DrawerTile(item: createLabelItem, onTap: onTap);
        }
      },
    );
  }
}