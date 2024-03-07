part of'create_label_field.dart';
class _DoneButtons extends StatelessWidget {
  final Label? label;
  final bool isFocused;
  const _DoneButtons({required this.isFocused, this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        15.pw,
        if (label == null)
          CustomIconButton(
              onTap: () {},
              icon: isFocused ? const Icon(Icons.done) : const SizedBox()),
        if (label != null)
          CustomIconButton(onTap: () {},
              icon: isFocused ? const Icon(Icons.done) : const Icon(Icons.edit)),
        5.pw,
      ],
    );
  }
}