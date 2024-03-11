import 'package:flutter/material.dart';
import 'package:notes/core/extension/context_extension.dart';
part 'chosen_color_widget.dart';
class ColorCircle extends StatelessWidget {
  final VoidCallback onTap;
  final int color;
  final bool isSelected;

  const ColorCircle({super.key,
    required this.onTap,
    required this.color,
    required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        height: context.height / 13.38181818181818,
        width: context.width / 6.545454545454545,
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color == Colors.transparent.value
                ? context.scaffoldBackground
                : Color(color),
            border: color == Colors.transparent.value
                ? Border.all(
                color: !isSelected ? Colors.white : Colors.transparent)
                : null),
        child: isSelected
            ? const _ChosenColorCircle()
            : (color == Colors.transparent.value && !isSelected)
            ? const Icon(Icons.format_color_reset_outlined)
            : null,
      ),
    );
  }
}