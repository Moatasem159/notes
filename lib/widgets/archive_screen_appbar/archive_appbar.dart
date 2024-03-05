import 'package:flutter/material.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/core/utils/app_text_styles.dart';
import 'package:notes/widgets/custom_icon_button.dart';
import 'package:notes/widgets/switch_list_view_button.dart';
part 'default_archive_appbar.dart';
class ArchiveAppbar extends StatelessWidget {
  const ArchiveAppbar({super.key});
  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      floating: true,
      pinned: false,
      titleSpacing: 0,
      expandedHeight: 60,
      collapsedHeight: 60,
      toolbarHeight: 60,
      automaticallyImplyLeading: false,
      flexibleSpace: _DefaultArchiveAppbar()
    );
  }
}

