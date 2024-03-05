import 'package:flutter/material.dart';
import 'package:notes/core/extension/empty_padding_extension.dart';
import 'package:notes/core/utils/app_text_styles.dart';
class EmptyBody extends StatelessWidget {
  final String title;
  final IconData icon;
  const EmptyBody({super.key, required this.title, required this.icon});
  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon,size: 135),
            15.ph,
            Text(title,style:AppStyles.styleSemiBold18(context))
          ],
        ),
      ),
    );
  }
}
