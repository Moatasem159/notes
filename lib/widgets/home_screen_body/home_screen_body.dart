import 'package:flutter/material.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/widgets/empty_body.dart';
import 'package:notes/widgets/home_screen_appbar/home_appbar.dart';
class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
      slivers: [
        const HomeAppBar(),
        EmptyBody(title: context.local.homeBodyTitle, icon: Icons.lightbulb_outline_rounded)
      ],
    );
  }
}