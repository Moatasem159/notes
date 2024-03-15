part of'home_screen_body.dart';
class _HomeAppBar extends StatelessWidget {
  const _HomeAppBar();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBarCubit, AppBarStates>(
      builder: (context, state) {
        return  SliverAppBar(
          expandedHeight: 65,
          pinned:!AppBarCubit.of(context).isBase,
          collapsedHeight: 65,
          automaticallyImplyLeading: false,
          backgroundColor: AppBarCubit.of(context).isBase?Colors.transparent:context.theme.colorScheme.onSecondary,
          floating: true,
          flexibleSpace: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: AppBarCubit.of(context).isBase?const _DefaultHomeAppbar():const DefaultOptionsAppBar(noteStatus:NoteStatus.active),
          ),
        );
      },
    );
  }
}
