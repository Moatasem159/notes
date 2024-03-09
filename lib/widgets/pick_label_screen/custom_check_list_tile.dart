import 'package:flutter/material.dart';
import 'package:notes/core/utils/app_text_styles.dart';
import 'package:notes/widgets/custom_check_button.dart';

class CustomCheckListTile extends StatefulWidget {
  final Function(bool) onChanged;
  final String title;
  final CheckType checkType;
  final bool isChecked;

  const CustomCheckListTile(
      {super.key,
      required this.onChanged,
      required this.title,
      required this.checkType,
      required this.isChecked});

  @override
  State<CustomCheckListTile> createState() => _CustomCheckListTileState();
}

class _CustomCheckListTileState extends State<CustomCheckListTile> {
  late bool _isChecked;
  late CheckType _checkType;
  @override
  void initState() {
    super.initState();
    _checkType=widget.checkType;
    _isChecked=widget.isChecked;
  }
  onTap(){
    setState(() {
      _isChecked=!_isChecked;
      if (_isChecked)
      {
        _checkType=CheckType.all;
      }
      else{
        _checkType=CheckType.none;
      }
      widget.onChanged.call(_isChecked);
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
        onTap:onTap,
        checkType: _checkType,
        checked: _isChecked,
      ),
    );
  }
}
