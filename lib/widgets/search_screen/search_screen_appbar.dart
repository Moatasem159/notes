part of'search_screen_body.dart';
class _SearchScreenAppBar extends StatelessWidget {
  const _SearchScreenAppBar();
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: context.theme.colorScheme.onSecondary,
      titleSpacing: 0,
      toolbarHeight: 70,
      title: TextFormField(decoration: InputDecoration(hintText: context.local.searchYourNotes, hintStyle: AppStyles.styleSemiBold20(context)),
      ),
    );
  }
}