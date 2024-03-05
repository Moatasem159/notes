import 'package:flutter/material.dart';
import 'package:notes/core/utils/app_text_styles.dart';
class NotesCounter extends StatelessWidget {
  const NotesCounter({super.key});
  @override
  Widget build(BuildContext context) {
    return Text("5", style: AppStyles.styleSemiBold24(context));
  }
}