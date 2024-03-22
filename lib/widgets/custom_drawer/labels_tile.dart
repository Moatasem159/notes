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
                  notesCubit: GetActiveNotesCubit.of(context)));
        }
        if (context.route.name == Routes.labelRoute) {
          context.pushNamed(Routes.createLabelRoute,
              arguments: CreateLabelParams(
                  isNew: true,
                  label: context.route.arguments as Label,
                  notesStatus: NoteStatus.labeled,
                  notesCubit: GetLabeledNotesCubit.of(context)));
        }
        if (context.route.name == Routes.archivedRoute) {
          context.pushNamed(Routes.createLabelRoute,
              arguments: CreateLabelParams(
                  isNew: true,
                  notesStatus: NoteStatus.archive,
                  notesCubit: GetArchivedNotesCubit.of(context)));
        }
        if (context.route.name == Routes.deletedRoute) {
          context.pushNamed(Routes.createLabelRoute,
              arguments: CreateLabelParams(
                  isNew: true,
                  notesStatus: NoteStatus.deleted,
                  notesCubit: GetDeletedNotesCubit.of(context)));
        }
      } else {
        Scaffold.of(context).closeDrawer();
      }
    }

    return BlocBuilder<GetLabelsCubit, GetLabelsStates>(
      builder: (context, state) {
        if (state is GetLabelsSuccessState &&
            GetLabelsCubit.of(context).allLabels.isNotEmpty) {
          return _LabelsList(
              labels: GetLabelsCubit.of(context).allLabels,
              item: createLabelItem,
              onTap: onTap);
        }
        return _DrawerTile(item: createLabelItem, onTap: onTap);
      },
    );
  }
}
