part of'deleted_appbar.dart';
class _DeletedOptionsAppBar extends StatelessWidget {
  const _DeletedOptionsAppBar();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomIconButton(onTap:AppBarCubit.of(context).removeSelection,icon: Icons.clear),
        const NotesCounter(),
        const Spacer(),
        CustomIconButton(onTap: () {}, icon: Icons.restore),
        const CustomPopUpMenu(noteStatus: NoteStatus.deleted)
      ],
    );
  }
}