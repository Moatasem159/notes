import 'package:flutter/material.dart';
import 'package:notes/core/extension/context_extension.dart';
class ToastWidget extends StatelessWidget {
  final String msg;
  const ToastWidget({super.key, required this.msg});
  @override
  Widget build(BuildContext context) {
    return Container(
      width:context.width,
      height: 40,
      padding:const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin:EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(spreadRadius: 2.5,color: Theme.of(context).primaryColorDark.withOpacity(0.1))],
          borderRadius: BorderRadius.circular(5),
          color: context.theme.colorScheme.secondary),
      child: Text(msg,style: Theme.of(context).textTheme.bodyMedium!.copyWith(
        color: Theme.of(context).primaryColorDark
      )),
    );
  }
}