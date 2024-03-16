part of 'label_screen_body.dart';

class _LabelAppbar extends StatelessWidget {
  const _LabelAppbar();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBarCubit, AppBarStates>(
      builder: (context, state) {
        return SliverAppBar(
          floating: true,
          pinned: !AppBarCubit.of(context).isBase,
          titleSpacing: 0,
          expandedHeight: 60,
          collapsedHeight: 60,
          toolbarHeight: 60,
          automaticallyImplyLeading: false,
          backgroundColor: AppBarCubit.of(context).isBase
              ? Colors.transparent
              : context.theme.colorScheme.onSecondary,
          flexibleSpace: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: AppBarCubit.of(context).isBase
                ? const _DefaultLabelAppbar()
                : const DefaultOptionsAppBar(noteStatus: NoteStatus.labeled),
          ),
        );
      },
    );
  }
}
