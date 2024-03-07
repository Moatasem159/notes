part of 'main_drawer.dart';

class _LabelsList extends StatelessWidget {
  final DrawerItemModel item;
  final VoidCallback onTap;

  const _LabelsList({required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(),
        const _LabelsHeader(),
        ListView.builder(
          itemCount: 1,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index)=>_LabelTile(Label(name: "name")),
        ),
        _DrawerTile(item: item, onTap: onTap),
        const Divider(),
      ],
    );
  }
}

