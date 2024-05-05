import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart'as intl;
import 'package:notes/core/extension/context_extension.dart';
class CustomTextFormField extends StatelessWidget {
  final int ? maxLines;
  final int ?minLines;
  final TextStyle style;
  final String hintText;
  final TextStyle ?hintStyle;
  final bool autoFocus;
  final void Function(String value)? onChange;
  final List<TextInputFormatter>? formatter;
  final String? Function(String? value)? validator;
  final AutovalidateMode ?autoValidateMode;
  final TextEditingController controller;
  const CustomTextFormField({
    super.key,
    this.maxLines,
    this.minLines,
    this.onChange,
    required this.style,
    required this.hintText,
    this.hintStyle,
    this.autoFocus = false,
    this.formatter,
    this.validator,
    this.autoValidateMode,
    required this.controller
  });

  @override
  Widget build(BuildContext context) {
    intl.TextDirection dir=intl.Bidi.detectRtlDirectionality(controller.text)?intl.TextDirection.RTL:intl.TextDirection.LTR;
    final ValueNotifier<intl.TextDirection> textDir = ValueNotifier(dir);
    return ValueListenableBuilder<intl.TextDirection>(
      builder: (context, intl.TextDirection value, child) {
        return TextFormField(
          controller:controller,
          textDirection:value==intl.TextDirection.RTL?TextDirection.rtl:TextDirection.ltr,
          autofocus:autoFocus,
          autovalidateMode: autoValidateMode,
          maxLines: maxLines,
          minLines: minLines,
          keyboardType: TextInputType.multiline,
          inputFormatters: formatter,
          style: style,
          onChanged: (input){
            intl.TextDirection direction=intl.Bidi.detectRtlDirectionality(controller.text)?intl.TextDirection.RTL:intl.TextDirection.LTR;
            if (direction != value) textDir.value = direction;
            onChange!(input);
          },
          validator: validator,
          cursorColor: Theme.of(context).primaryColorLight,
          decoration: InputDecoration(
            isDense: true,
            isCollapsed: true,
            constraints: BoxConstraints(maxWidth: context.width - 35),
            hintText: hintText,
            hintStyle: hintStyle,
          ),
        );
      }, valueListenable: textDir,
    );
  }
}