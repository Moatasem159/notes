part of'main_drawer.dart';
class _DrawerTile extends StatelessWidget {
  final DrawerItemModel item;
  final VoidCallback ?onTap;
  const _DrawerTile({required this.item,required this.onTap});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 1),
      child: Material(
        borderRadius:BorderRadius.circular(25),
        color: item.location==context.route.name?context.theme.listTileTheme.selectedColor:Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(25),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 7),
            margin: const EdgeInsets.symmetric(vertical: 9,horizontal: 8),
            decoration:BoxDecoration(
              borderRadius:BorderRadius.circular(25),
            ),
            child: Row(
              children: [
                Icon(item.icon),
                15.pw,
                Text(item.title,style: AppStyles.styleSemiBold18(context))
              ],
            ),
          ),
        ),
      ),
    );
  }
}