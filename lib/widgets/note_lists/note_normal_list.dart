import 'package:flutter/material.dart';
class NoteNormalList extends StatelessWidget {
  final int length;
  final Widget Function(BuildContext context, int index) itemBuilder;
  const NoteNormalList({super.key, required this.length, required this.itemBuilder});
  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: length,
      itemBuilder: itemBuilder,
    );
  }
}
