part of'home_appbar.dart';
class _OptionsHomeAppBar extends StatelessWidget {
  const _OptionsHomeAppBar();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 45),
      child: Row(
        children: [
          CustomIconButton(onTap:(){},icon: Icons.clear),
          const NotesCounter(),
          const Spacer(),
          CustomIconButton(onTap: (){},icon:Icons.push_pin_outlined),
          CustomIconButton(onTap: () {}, icon: Icons.notification_add_outlined),
          CustomIconButton(onTap: () {}, icon: Icons.color_lens_outlined),
          CustomIconButton(onTap: () {}, icon: Icons.label_outline_rounded),
          const CustomPopUpMenu()
        ],
      ),
    );
  }
}