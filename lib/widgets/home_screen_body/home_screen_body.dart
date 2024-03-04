import 'package:flutter/material.dart';
import 'package:notes/widgets/home_screen_appbar/home_screen_appbar.dart';
class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      floatHeaderSlivers: true,
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        const HomeAppBar(),
      ],
      body: const CustomScrollView(),
    );
  }
}