part of'main_drawer.dart';
class _DrawerTitle extends StatelessWidget {
  const _DrawerTitle();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.symmetric(horizontal: 18,vertical: 15),
      child: Text(context.local.appTitle,style: Theme.of(context).textTheme.titleLarge),
    );
  }
}