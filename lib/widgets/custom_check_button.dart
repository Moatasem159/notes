import 'package:flutter/material.dart';
import 'package:notes/models/label.dart';

class CustomCheckbox extends StatelessWidget {
  final CheckType checkType;
  final VoidCallback onTap;
  const CustomCheckbox({super.key,required this.onTap, required this.checkType});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(6.0),
      onTap:onTap,
      child: Container(
        width: 24.0,
        height: 24.0,
        decoration: BoxDecoration(
          color: (checkType==CheckType.all) ?
          Colors.blue :Colors.transparent,
          border: Border.all(
            color:(checkType==CheckType.all||checkType==CheckType.semi) ? Colors.blue : Colors.grey,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: (checkType==CheckType.all||checkType==CheckType.semi)
            ?  FittedBox(
                child: Icon(
                  checkType==CheckType.all?Icons.done:checkType==CheckType.semi?Icons.remove:null,
                  color: checkType==CheckType.semi?Colors.blue:null,
                ),
              )
            : null,
      ),
    );
  }
}


