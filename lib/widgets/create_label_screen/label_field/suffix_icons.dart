part of'label_field.dart';
class _LabelSuffixIcon extends StatelessWidget {
  final bool isNew;
  final bool isFocused;
  final VoidCallback? requestFocus;
  final VoidCallback ?addLabel;
  final VoidCallback ?editLabel;
  const _LabelSuffixIcon({required this.isNew, required this.isFocused, required this.requestFocus, required this.addLabel, required this.editLabel});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if(isNew && isFocused)
              CustomIconButton(
                  onTap: addLabel,
                  icon: isFocused ? const Icon(Icons.done) : const SizedBox()),
            if(!isNew)
              CustomIconButton(
                  onTap:isFocused?editLabel:requestFocus,
                  icon: Icon(isFocused?Icons.done:Icons.edit)),
          ]
      ),
    );
  }
}