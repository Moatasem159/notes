import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  final CheckType checkType;
  final VoidCallback onTap;
  final bool checked;
  const CustomCheckbox({super.key,required this.onTap, required this.checkType, required this.checked});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(6.0),
      onTap:onTap,
      child: Container(
        width: 24.0,
        height: 24.0,
        decoration: BoxDecoration(
          color: (checked&&checkType==CheckType.all) ?
          Colors.blue :Colors.transparent,
          border: Border.all(
            color:checked ? Colors.blue : Colors.grey,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: checked
            ?  FittedBox(
                child: Icon(
                  checkType==CheckType.all?Icons.done:Icons.remove,
                  color: checkType==CheckType.semi?Colors.blue:null,
                ),
              )
            : null,
      ),
    );
  }
}

enum CheckType { all, semi, none }
