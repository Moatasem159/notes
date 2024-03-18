import 'package:flutter/material.dart';
import 'package:notes/models/label.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/cubits/label_actions_bloc/label_actions_bloc.dart';
import 'package:notes/widgets/create_label_screen/label_field/label_field.dart';
class EditLabelField extends StatefulWidget {
  final Label label;
  final int index;
  final TextEditingController controller;
  const EditLabelField({super.key, required this.label, required this.index, required this.controller});
  @override
  State<EditLabelField> createState() => _EditLabelFieldState();
}
class _EditLabelFieldState extends State<EditLabelField> {
  late GlobalKey<FormState> _formKey;
  late FocusNode _focusNode;
  late bool _found;
  late bool _isFocused;
  late String text;
  late bool _edited;
  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_listen);
    _isFocused = false;
    _formKey = GlobalKey<FormState>();
    _found = false;
    text=widget.controller.text;
    _edited=false;
  }
  @override
  void dispose() {
    _focusNode.dispose();
    _focusNode.removeListener(_listen);
    super.dispose();
  }
  _edit() {
    if(text.trim()==widget.controller.text.trim())
      {
      _focusNode.unfocus();
      }
    else{
      bool found = LabelActionsBloc.of(context).checkFound(widget.controller.text);
      _found = found;
      bool validate = _formKey.currentState!.validate();
      if (validate) {
        if (widget.controller.text.isNotEmpty) {
          LabelActionsBloc.of(context).add(EditLabelEvent(widget.label, widget.controller.text));
          _edited=true;
        } else {
          _focusNode.unfocus();
        }
      } else {
        _focusNode.requestFocus();
      }
    }
  }
  _listen() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
      if(!_isFocused&&!_edited) {
        widget.controller.text=text;
        _formKey.currentState!.reset();
        _edited=false;
        _found=false;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<LabelActionsBloc, LabelActionsStates>(
      listener: (context, state) {
        if (state is EditLabelSuccessState) {
          _focusNode.unfocus();
        }
      },
      child: LabelField(
        focusNode: _focusNode,
        formKey: _formKey,
        isFocused: _isFocused,
        requestFocus: _focusNode.requestFocus,
        controller: widget.controller,
        editLabel: _edit,
        onSubmit: _edit,
        validate: (value) {
          if (value!.isEmpty) {
            return context.local.enterLabelName;
          }
          if (value.length >= 50) {
            return context.local.enterShorterLabel;
          }
          if (_found) {
            return context.local.labelAlreadyExists;
          }
          return null;
        },
        deleteLabel: ()=>LabelActionsBloc.of(context).add(DeleteLabelEvent(widget.label)),
      ),
    );
  }
}