part of 'main_drawer.dart';
class _LabelsList extends StatelessWidget {
  final DrawerItemModel item;
  final VoidCallback onTap;
  final List<Label> labels;
  const _LabelsList({required this.item, required this.onTap, required this.labels});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(),
        const _LabelsHeader(),
        ListView.builder(
          itemCount: labels.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index)=>_LabelTile(labels[index]),
        ),
        _DrawerTile(item: item, onTap: onTap),
        const Divider(),
      ],
    );
  }
}

