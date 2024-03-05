part of'custom_popup_menu.dart';
class CustomPopUpMenuItem extends StatelessWidget{
  final String title;
  const CustomPopUpMenuItem({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: context.width/2.4,
        child: Text(title)
    );
  }
}