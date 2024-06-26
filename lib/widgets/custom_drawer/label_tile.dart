part of'main_drawer.dart';
class _LabelTile extends StatelessWidget {
  final Label label;
  const _LabelTile(this.label);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 1),
      child: Material(
        color: (context.route.name==Routes.labelRoute&&(context.route.arguments as Label).name==label.name)?context.theme.listTileTheme.selectedColor:Colors.transparent,
        borderRadius:BorderRadius.circular(25),
        child: InkWell(
          onTap: ()async{
            Scaffold.of(context).closeDrawer();
            if(context.route.name==Routes.labelRoute&&(context.route.arguments as Label).name!=label.name){
              context.pushReplacementNamed(Routes.labelRoute,arguments:label);
            }
            else if(context.route.name!=Routes.labelRoute) {
              context.pushReplacementNamed(Routes.labelRoute,arguments:label);
            }
          },
          borderRadius: BorderRadius.circular(25),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 7),
            margin: const EdgeInsets.symmetric(vertical: 9,horizontal: 8),
            decoration:BoxDecoration(
              borderRadius:BorderRadius.circular(25),
            ),
            child: Row(
              children: [
                const Icon(Icons.label_outline_rounded),
                15.pw,
                Text(label.name,style: AppStyles.styleSemiBold18(context))
              ],
            ),
          ),
        ),
      ),
    );
  }
}