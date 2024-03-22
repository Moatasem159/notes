part of'main_drawer.dart';
class _LabelsHeader extends StatelessWidget {
  const _LabelsHeader();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Row(
        children: [
          Text(context.local.labels, style: AppStyles.styleRegular16(context)),
          const Spacer(),
          InkWell(
            onTap: (){
              if (context.route.name != Routes.createLabelRoute) {
                Scaffold.of(context).closeDrawer();
                if (context.route.name == Routes.homeRoute) {
                  context.pushNamed(Routes.createLabelRoute,
                      arguments: CreateLabelParams(
                          isNew: false,
                          notesCubit: GetActiveNotesCubit.of(context)));
                }
                if (context.route.name == Routes.labelRoute) {
                  context.pushNamed(Routes.createLabelRoute,
                      arguments: CreateLabelParams(
                          isNew: false,
                          label: context.route.arguments as Label,
                          notesStatus: NoteStatus.labeled,
                          notesCubit: GetLabeledNotesCubit.of(context)));
                }
                if (context.route.name == Routes.archivedRoute) {
                  context.pushNamed(Routes.createLabelRoute,
                      arguments: CreateLabelParams(
                          isNew: false,
                          notesStatus: NoteStatus.archive,
                          notesCubit: GetArchivedNotesCubit.of(context)));
                }
                if (context.route.name == Routes.deletedRoute) {
                  context.pushNamed(Routes.createLabelRoute,
                      arguments: CreateLabelParams(
                          isNew: false,
                          notesStatus: NoteStatus.deleted,
                          notesCubit: GetDeletedNotesCubit.of(context)));
                }
              } else {
                Scaffold.of(context).closeDrawer();
              }
            },
            borderRadius: BorderRadius.circular(15),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: Text(
                context.local.edit,
                style: AppStyles.styleRegular16(context),
              ),
            ),
          )
        ],
      ),
    );
  }
}