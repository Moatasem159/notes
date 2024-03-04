import 'package:flutter/material.dart';
class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final String ?tooltip;
  final double ?iconSize;
  final VoidCallback onTap;
  const CustomIconButton({super.key, required this.onTap, required this.icon, this.tooltip, this.iconSize});
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      shape: const CircleBorder(),
      clipBehavior: Clip.hardEdge,
      child: IconButton(
        onPressed: onTap,
        padding: EdgeInsets.zero,
        tooltip: tooltip,
        splashRadius: 20,
        icon: Icon(icon, size: iconSize,),),
    );
  }
}