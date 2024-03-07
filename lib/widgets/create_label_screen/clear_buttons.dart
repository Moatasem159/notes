part of'create_label_field.dart';
class _ClearButtons extends StatelessWidget {
  final Label? label;
  final bool isFocused;
  final VoidCallback toggle;
  const _ClearButtons({required this.label,required this.isFocused, required this.toggle});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        5.pw,
        if (label == null)
          CustomIconButton(
              onTap: toggle,
              icon: Icon(isFocused ? Icons.clear : Icons.add)),
        if (label != null)
          CustomIconButton(
              onTap: isFocused?(){}:null,
              icon: Icon(isFocused
                  ? Icons.delete_outline_rounded
                  : Icons.label_outline_rounded)),
        15.pw,
      ],
    );
  }
}