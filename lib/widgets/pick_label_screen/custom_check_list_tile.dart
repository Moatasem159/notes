import 'package:flutter/material.dart';
import 'package:notes/core/utils/app_text_styles.dart';
import 'package:notes/models/label.dart';
import 'package:notes/widgets/custom_check_button.dart';
class CustomCheckListTile extends StatefulWidget {
  final Function(CheckType checkType) onChanged;
  final String title;
  final CheckType checkType;
  const CustomCheckListTile({
    super.key,
    required this.onChanged,
    required this.title,
    required this.checkType,
  });
  @override
  State<CustomCheckListTile> createState() => _CustomCheckListTileState();
}

class _CustomCheckListTileState extends State<CustomCheckListTile> {
  late CheckType _checkType;
  @override
  void initState() {
    super.initState();
    _checkType = widget.checkType;
  }

  onTap() {
    setState(() {
      switch (_checkType) {
        case CheckType.all:
          _checkType = CheckType.none;
        case CheckType.semi:
          _checkType = CheckType.all;
        case CheckType.none:
          _checkType = CheckType.all;
      }
      widget.onChanged.call(_checkType);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: const Icon(Icons.label_outline_rounded),
      title: Text(widget.title, style: AppStyles.styleRegular24(context)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 17),
      trailing: CustomCheckbox(
        onTap: onTap,
        checkType: _checkType,
      ),
    );
  }
}
