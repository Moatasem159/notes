import 'package:flutter/material.dart';
import 'package:notes/core/utils/app_text_styles.dart';
import 'package:notes/widgets/custom_check_button.dart';

class CustomCheckListTile extends StatelessWidget {
  final Function(bool) onChanged;
  final String title;
  final CheckType checkType;
  final bool isChecked;
  const CustomCheckListTile({super.key, required this.onChanged, required this.title, required this.checkType, required this.isChecked});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onChanged(isChecked);
      },
      leading:const Icon(Icons.label_outline_rounded),
      title: Text(title,style: AppStyles.styleRegular24(context)),
      contentPadding:const EdgeInsets.symmetric(horizontal: 17),
      trailing: CustomCheckbox(
        onChanged:onChanged,
        checkType: checkType,
        checked: false,
      ),
    );
  }
}
