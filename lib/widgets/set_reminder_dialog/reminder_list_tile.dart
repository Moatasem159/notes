part of 'reminder_dialog.dart';
class _ReminderListTile extends StatelessWidget {
  final String title;
  final String ?subTitle;
  final IconData icon;
  final VoidCallback onTap;
  const _ReminderListTile({
    required this.title,
    this.subTitle,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title, style: AppStyles.styleRegular20(context)),
      subtitle: subTitle == null
          ? null
          : Text(subTitle!, style: AppStyles.styleRegular16(context)),
      trailing: Icon(icon),
      onTap: onTap,
      dense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}