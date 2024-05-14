part of'add_note_button.dart';
class AddNoteButtonBuilder extends StatelessWidget {
  final VoidCallback onTap;
  const AddNoteButtonBuilder({super.key, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap:onTap,
      child: CustomPaint(
        size: const Size(60, 58),
        painter: _AddIconPainter(),
      ),
    );
  }
}