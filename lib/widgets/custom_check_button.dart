import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  const CustomCheckbox({super.key,required this.onChanged, required this.checkType, required this.checked});
  final CheckType checkType;
  final Function(bool) onChanged;
  final bool checked;
  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  late bool _isChecked;
  late CheckType _checkType;
  @override
  void initState() {
    super.initState();
    _checkType=widget.checkType;
    _isChecked=widget.checked;
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(6.0),
      onTap: () {
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
      },
      child: Container(
        width: 24.0,
        height: 24.0,
        decoration: BoxDecoration(
          color: (_isChecked&&_checkType==CheckType.all) ?
          Colors.blue :Colors.transparent,
          border: Border.all(
            color:_isChecked ? Colors.blue : Colors.grey,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: _isChecked
            ?  FittedBox(
                child: Icon(
                  _checkType==CheckType.all?Icons.done:Icons.remove,
                  color: _checkType==CheckType.semi?Colors.blue:null,
                ),
              )
            : null,
      ),
    );
  }
}

enum CheckType { all, semi, none }
