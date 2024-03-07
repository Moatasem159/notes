part of'main_drawer.dart';
class _DrawerBuilder extends StatelessWidget {
  const _DrawerBuilder();
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: const ScrollBehavior().copyWith(overscroll: false),
      child: Scrollbar(
        child: ListView(
          children: const [
            _DrawerTitle(),
            _DrawerTilesList(),
          ],
        ),
      ),
    );
  }
}