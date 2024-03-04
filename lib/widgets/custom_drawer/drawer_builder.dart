part of'main_drawer.dart';
class _DrawerBuilder extends StatelessWidget {
  const _DrawerBuilder();
  @override
  Widget build(BuildContext context) {
    return  ListView(
      children: const [
        _DrawerTitle(),
        _DrawerTilesList(),
      ],
    );
  }
}