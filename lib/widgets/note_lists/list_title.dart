import 'package:flutter/material.dart';
import 'package:notes/core/utils/app_text_styles.dart';
class ListTitle extends StatelessWidget {
  final String title;
  const ListTitle({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Text(title, style: AppStyles.styleRegular14(context)),
      ),
    );
  }
}