part of 'pick_label_list.dart';

class _CreateLabelTile extends StatelessWidget {
  const _CreateLabelTile();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PickLabelsCubit, PickLabelsStates>(
      builder: (context, state) {
        if(PickLabelsCubit.of(context).notFound) {
          return SliverToBoxAdapter(
          child: ListTile(
            onTap: PickLabelsCubit.of(context).createNewLabel,
            leading: const Icon(Icons.add),
            title: Text(
                "${context.local.create} \"${PickLabelsCubit.of(context).controller.text.trim()}\"",
                style: AppStyles.styleRegular20(context)),
            contentPadding: const EdgeInsets.symmetric(horizontal: 17),
          ),
        );
        }
        return const SliverToBoxAdapter();
      },
    );
  }
}
