import 'package:flutter/material.dart';
import 'package:notes/core/extension/context_extension.dart';
class AddNoteButtonBuilder extends StatelessWidget {
  final VoidCallback onTap;
  const AddNoteButtonBuilder({super.key, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: onTap,
      child: SizedBox(
        height: context.height / 13.38181818181818,
        width: context.width / 6.206896551724138,
        child: const Icon(Icons.add, size: 40),
      ),
    );
  }
}