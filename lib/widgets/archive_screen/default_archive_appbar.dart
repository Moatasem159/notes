part of'archive_screen_body.dart';
class _DefaultArchiveAppbar extends StatelessWidget {
  const _DefaultArchiveAppbar();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomIconButton(icon: const Icon(Icons.menu_rounded),onTap: Scaffold.of(context).openDrawer),
        Text(context.local.archive,style: AppStyles.styleRegular24(context)),
        const Spacer(),
        CustomIconButton(onTap: (){
          SearchScreenParams params =SearchScreenParams(noteStatus: NoteStatus.archive, cubit: GetArchivedNotesCubit.of(context));
          context.pushNamed(Routes.searchRoute,arguments: params);
        }, icon: const Icon(Icons.search)),
        const SwitchListViewButton(),
      ],
    );
  }
}