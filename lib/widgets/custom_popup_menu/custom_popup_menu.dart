import 'package:flutter/material.dart';
import 'package:notes/core/extension/context_extension.dart';
part 'custom_popup_menu_item.dart';
class CustomPopUpMenu extends StatelessWidget {
  const CustomPopUpMenu({super.key});
  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Colors.transparent,
      child:PopupMenuButton(
          clipBehavior: Clip.hardEdge,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)),
          splashRadius: 20,
          constraints: BoxConstraints(
              maxWidth: context.width / 1.894736842105263),
          itemBuilder: (_) {
            return [
              PopupMenuItem(
                onTap: () {},
                child: CustomPopUpMenuItem(title:context.local.archive),
              ),
              PopupMenuItem(
                onTap: () {},
                child: CustomPopUpMenuItem(title: context.local.delete),
              ),
            ];
          },
          icon: const Icon(Icons.more_vert_outlined)),
    );
  }
}