import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  final TextEditingController ?controller;
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
    this.controller
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller:controller,
      autofocus:autoFocus,
      autovalidateMode: autoValidateMode,
      maxLines: maxLines,
      minLines: minLines,
      keyboardType: TextInputType.multiline,
      inputFormatters: formatter,
      style: style,
      onChanged: onChange,
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
  }
}