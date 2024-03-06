import 'package:flutter/material.dart';
class CustomScrollList extends StatelessWidget {
  final List<Widget>slivers;
  const CustomScrollList({super.key, required this.slivers});
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: CustomScrollView(
        scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
        slivers: slivers
      ),
    );
  }
}
