import 'package:flutter/material.dart';
import 'package:notes/core/extension/context_extension.dart';
class CustomPopupMenu extends StatelessWidget {
  final List<PopupMenuItem> items;
  const CustomPopupMenu({super.key, required this.items});
  @override
  Widget build(BuildContext context) {
    return  Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Colors.transparent,
      child: PopupMenuButton(
        color: context.theme.colorScheme.onSecondary,
        clipBehavior: Clip.hardEdge,
        padding: EdgeInsets.zero,
        icon: const Icon(Icons.more_vert_outlined),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        splashRadius: 20,
        constraints:
        BoxConstraints(maxWidth: context.width / 1.894736842105263),
        itemBuilder:(BuildContext _) => items,
      ),
    );
  }
}