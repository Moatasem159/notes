import 'package:flutter/material.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/core/extension/empty_padding_extension.dart';
import 'package:notes/core/utils/app_text_styles.dart';
import 'package:notes/models/label.dart';
import 'package:notes/widgets/custom_icon_button.dart';
part 'done_buttons.dart';
part 'clear_buttons.dart';
class CreateLabelField extends StatefulWidget {
  final bool isNew;
  final Label? label;
  const CreateLabelField({super.key, this.label,this.isNew=false});
  @override
  State<CreateLabelField> createState() => _CreateLabelFieldState();
}
class _CreateLabelFieldState extends State<CreateLabelField> {
  late GlobalKey<FormState> _formKey;
  late bool _isFocused;
  late FocusNode _focusNode;
  @override
  void initState() {
    super.initState();
    _isFocused = false;
    _formKey = GlobalKey<FormState>();
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusChange);
  }
  void toggleFocus() {
    setState(() {
      if (_focusNode.hasFocus) {
        _focusNode.unfocus();
      } else {
        _focusNode.requestFocus();
      }
    });
  }
  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }
  BorderSide _getBorder() {
    return BorderSide(
      color: _isFocused ? Colors.grey.withOpacity(0.7) : Colors.transparent,
      width: 1,
    );
  }
  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
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
        mainAxisSize: MainAxisSize.min,
        children: [
          _ClearButtons(label: widget.label, isFocused: _isFocused,toggle: toggleFocus),
           Expanded(
            flex: 2,
            child: Form(
              key: _formKey,
              child: TextFormField(
                autofocus: widget.isNew,
                autovalidateMode: AutovalidateMode.always,
                focusNode: _focusNode,
                initialValue: widget.label?.name,
                maxLength: 50,
                validator: (value) {
                  if (value!.length >= 50) {
                    return context.local.enterShorterLabel;
                  }
                  if (widget.label != null) {
                    if (value.isEmpty) {
                      return context.local.enterLabelName;
                    }
                  }
                  return null;
                },
                decoration: InputDecoration(
                    isDense: true,
                    isCollapsed: true,
                    counterText: '',
                    errorStyle: AppStyles.styleRegular16(context),
                    hintText: widget.label == null
                        ? context.local.createNewLabel
                        : null,
                    hintStyle: AppStyles.styleSemiBold20(context)),
              ),
            ),
          ),
          _DoneButtons(isFocused: _isFocused,label: widget.label),
        ],
      ),
    );
  }
}