import 'package:flutter/material.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/core/utils/app_text_styles.dart';
class CustomPopUpMenuItem extends StatelessWidget{
  final String title;
  const CustomPopUpMenuItem({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: context.width/2.4,
        child: Text(title,style: AppStyles.styleRegular20(context))
    );
  }
}