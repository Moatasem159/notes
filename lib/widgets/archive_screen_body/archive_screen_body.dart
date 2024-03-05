import 'package:flutter/material.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/widgets/archive_screen_appbar/archive_appbar.dart';
import 'package:notes/widgets/empty_body.dart';
class ArchiveScreenBody extends StatelessWidget {
  const ArchiveScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
      slivers: [
        const ArchiveAppbar(),
        EmptyBody(title: context.local.archiveBodyTitle, icon: Icons.archive_outlined)
      ],
    );
  }
}