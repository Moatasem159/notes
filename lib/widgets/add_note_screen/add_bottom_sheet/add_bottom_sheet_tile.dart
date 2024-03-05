part of'add_bottom_sheet.dart';
class _AddBottomSheetTile extends StatelessWidget {
  final VoidCallback  onTap;
  final IconData icon;
  final String title;
  const _AddBottomSheetTile({required this.icon, required this.title, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Icon(icon),
            10.pw,
            Text(title)
          ],
        ),
      ),
    );
  }
}