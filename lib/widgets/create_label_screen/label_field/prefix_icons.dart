part of'label_field.dart';
class _LabelFieldPrefixIcons extends StatelessWidget {
  final bool isNew;
  final bool isFocused;
  final VoidCallback? toggleFocus;
  final VoidCallback ?deleteLabel;
  const _LabelFieldPrefixIcons({required this.isNew, required this.toggleFocus, required this.isFocused, required this.deleteLabel});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if(isNew)
            CustomIconButton(iconSize: 25,onTap: toggleFocus, icon: Icon(isFocused ? Icons.clear : Icons.add),),
          if(!isNew)
            CustomIconButton(iconSize:22,onTap: isFocused ? deleteLabel : null, icon: Icon(isFocused
                ? Icons.delete_forever
                : Icons.label_outline_rounded)),
        ],
      ),
    );
  }
}