part of'pick_label_screen_body.dart';
class _PickLabelAppbar extends StatelessWidget {
  const _PickLabelAppbar();
  @override
  Widget build(BuildContext context) {
    return BlocListener<PickLabelsCubit, PickLabelsStates>(
      listener: PickLabelsCubit.of(context).appbarListener,
      child: SliverAppBar(
        titleSpacing:0,
        title: TextFormField(
          controller: PickLabelsCubit.of(context).controller,
          onChanged: (value) {
            PickLabelsCubit.of(context).filterLabels(value: value);
          },
          decoration: InputDecoration(hintText: context.local.enterLabelName,
            hintStyle: AppStyles.styleRegular20(context)
          ),
        ),
      ),
    );
  }
}