import 'package:flutter/material.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/widgets/deleted_screen_appbar/deleted_appbar.dart';
import 'package:notes/widgets/empty_body.dart';
class DeletedScreenBody extends StatelessWidget {
  const DeletedScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
      slivers: [
        const DeletedAppbar(),
        EmptyBody(title: context.local.deletedBodyTitle, icon: Icons.delete_outline_rounded)
      ],
    );
  }
}