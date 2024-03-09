import 'package:flutter/material.dart';
import 'package:notes/core/utils/app_text_styles.dart';
import 'package:notes/widgets/custom_icon_button.dart';
import 'package:notes/core/extension/context_extension.dart';
part 'prefix_icons.dart';
part 'suffix_icons.dart';
class LabelField extends StatelessWidget {
  final bool isNew;
  final bool adding;
  final VoidCallback? deleteLabel;
  final VoidCallback? addLabel;
  final VoidCallback? editLabel;
  final VoidCallback? onSubmit;
  final FormFieldValidator<String>? validate;
  final TextEditingController? controller;
  final ValueChanged<String>? onChange;
  final GlobalKey<FormState> formKey;
  final FocusNode focusNode;
  final bool isFocused;
  final VoidCallback ?requestFocus;
  final VoidCallback ?toggleFocus;
  const LabelField(
      {super.key,
      this.isNew = false,
      this.deleteLabel,
      this.onSubmit,
      this.validate,
      this.controller,
      this.addLabel,
      this.editLabel,
      this.onChange,
      this.requestFocus,
      this.toggleFocus,
      this.adding=false,
      required this.formKey,
      required this.focusNode,
      required this.isFocused,
      });

  BorderSide _getBorder() {
    return BorderSide(
      color: isFocused ? Colors.grey.withOpacity(0.7) : Colors.transparent,
      width: 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: _getBorder(),
          bottom: _getBorder(),
        ),
      ),
      child: Row(
        children: [
          _LabelFieldPrefixIcons(
              isNew: adding,
              toggleFocus: toggleFocus,
              isFocused: isFocused,
              deleteLabel: deleteLabel),
          Expanded(
            flex: 2,
            child: Form(
              key: formKey,
              child: TextFormField(
                maxLength: 50,
                controller: controller,
                autofocus: isNew,
                textAlignVertical: TextAlignVertical.center,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                focusNode: focusNode,
                onFieldSubmitted: (value)=>onSubmit!(),
                validator: validate,
                onChanged: onChange,
                decoration: InputDecoration(
                  isDense: true,
                  isCollapsed: true,
                  counterText: '',
                  errorStyle: AppStyles.styleRegular16(context),
                  hintText: adding ? context.local.createNewLabel : null,
                  hintStyle: AppStyles.styleSemiBold20(context),
                ),
              ),
            ),
          ),
          _LabelSuffixIcon(
              addLabel: addLabel,
              editLabel: editLabel,
              isNew: adding,
              isFocused: isFocused,
              requestFocus: requestFocus),
        ],
      ),
    );
  }
}