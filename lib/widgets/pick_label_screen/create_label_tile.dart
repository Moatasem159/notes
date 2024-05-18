part of 'pick_label_screen_body.dart';
class _CreateLabelTile extends StatefulWidget {
  const _CreateLabelTile();
  @override
  State<_CreateLabelTile> createState() => _CreateLabelTileState();
}
class _CreateLabelTileState extends State<_CreateLabelTile>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 250));
    final CurvedAnimation curveAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.linear);
    _animation = Tween<double>(begin: 0, end: 1).animate(curveAnimation);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PickLabelsCubit, PickLabelsStates>(
      listener: (context, state) {
        final bool notFound = PickLabelsCubit.of(context).notFound;
        if (notFound) {
          _controller.forward();
        } else  {
          _controller.reverse();
        }
      },
      child: SliverFadeTransition(
        opacity: _animation,
        sliver: SliverToBoxAdapter(
          child: SizeTransition(
            sizeFactor: _animation,
            child: BlocBuilder<PickLabelsCubit, PickLabelsStates>(
              builder: (context, state) {
                return ListTile(
                  onTap:()async{
                     Future.delayed(const Duration(milliseconds: 150)).then((value) {
                      PickLabelsCubit.of(context).createNewLabel();
                    },);
                  },
                  leading: const Icon(Icons.add),
                  title: Text(
                    "${context.local.create} \"${PickLabelsCubit.of(context).controller.text.trim()}\"",
                    style: AppStyles.styleRegular20(context),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 17),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
