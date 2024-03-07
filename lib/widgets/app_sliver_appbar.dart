import 'package:flutter/material.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/core/utils/app_text_styles.dart';

class AppSliverAppbar extends StatelessWidget {
  const AppSliverAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text(context.local.editLabel),
      titleSpacing: 0,
      titleTextStyle: AppStyles.styleRegular24(context),
      floating: true,
    );
  }
}