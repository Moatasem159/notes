import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
class NoteGridList extends StatelessWidget {
  final int length;
  final Widget Function(BuildContext context, int index) itemBuilder;
  const NoteGridList({super.key,required this.itemBuilder, required this.length});
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: MasonryGridView.builder(
        itemCount:length,
        shrinkWrap:true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder:itemBuilder,
      ),
    );
  }
}