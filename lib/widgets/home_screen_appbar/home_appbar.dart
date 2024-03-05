import 'package:flutter/material.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/core/utils/app_text_styles.dart';
import 'package:notes/widgets/custom_icon_button.dart';
import 'package:notes/widgets/switch_list_view_button.dart';
part 'default_home_appbar.dart';
class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      expandedHeight: 65,
      collapsedHeight: 65,
      automaticallyImplyLeading: false,
      backgroundColor:Colors.transparent,
      floating: true,
      pinned: false,
      flexibleSpace:_DefaultHomeAppbar()
    );
  }
}