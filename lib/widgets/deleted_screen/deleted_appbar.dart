part of 'deleted_screen_body.dart';
class _DeletedAppbar extends StatelessWidget {
  const _DeletedAppbar();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesActionsBloc(sl()),
      child: BlocBuilder<AppBarCubit, AppBarStates>(
        builder: (context, state) {
          return SliverAppBar(
            floating: true,
            pinned: !AppBarCubit.of(context).isBase,
            titleSpacing: 0,
            expandedHeight: 60,
            collapsedHeight: 60,
            backgroundColor: AppBarCubit.of(context).isBase
                ? Colors.transparent
                : context.theme.colorScheme.onSecondary,
            toolbarHeight: 60,
            automaticallyImplyLeading: false,
            flexibleSpace: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: AppBarCubit.of(context).isBase
                  ? const _DefaultDeletedAppbar()
                  : const _DeletedOptionsAppBar(),
            ),
          );
        },
      ),
    );
  }
}