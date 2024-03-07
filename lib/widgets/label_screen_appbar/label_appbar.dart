import 'package:flutter/material.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/core/utils/app_text_styles.dart';
import 'package:notes/widgets/custom_icon_button.dart';
import 'package:notes/widgets/custom_popup_menu/custom_popup_menu.dart';
import 'package:notes/widgets/custom_popup_menu/custom_popup_menu_item.dart';
import 'package:notes/widgets/switch_list_view_button.dart';
part 'default_label_appbar.dart';
part 'label_popup_menu.dart';
class LabelAppbar extends StatelessWidget {
  final String title;
  const LabelAppbar({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      pinned:false,
      titleSpacing: 0,
      expandedHeight: 60,
      collapsedHeight: 60,
      toolbarHeight: 60,
      automaticallyImplyLeading: false,
      backgroundColor:Colors.transparent,
      flexibleSpace: _DefaultLabelAppbar(title),
    );
  }
}