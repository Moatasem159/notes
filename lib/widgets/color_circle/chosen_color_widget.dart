part of'color_circle.dart';
class _ChosenColorCircle extends StatelessWidget {
  const _ChosenColorCircle();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black45,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.blue, width: 3)),
      child: const Icon(Icons.done_rounded, color: Colors.blue, size: 40));
  }
}