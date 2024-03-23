part of 'home_screen_body.dart';

class _HomeAppBar extends StatelessWidget {
  const _HomeAppBar();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBarCubit, AppBarStates>(
      builder: (context, state) {
        return SliverAppBar(
          expandedHeight: 65,
          collapsedHeight: 65,
          systemOverlayStyle:AppBarCubit.of(context).isBase ? AppTheme.systemUiOverlayStyle(context):null,
          floating: true,
          pinned: !AppBarCubit.of(context).isBase,
          automaticallyImplyLeading: false,
          backgroundColor: AppBarCubit.of(context).isBase ? Colors.transparent:context.theme.colorScheme.onSecondary,
          flexibleSpace: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: AppBarCubit.of(context).isBase
                ? const _DefaultHomeAppbar()
                : const DefaultOptionsAppBar(noteStatus: NoteStatus.active),
          ),
        );
      },
    );
  }
}