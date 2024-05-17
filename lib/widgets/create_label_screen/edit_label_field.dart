import 'package:flutter/material.dart';
import 'package:notes/models/label.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/cubits/label_actions_bloc/label_actions_bloc.dart';
import 'package:notes/widgets/create_label_screen/label_field/label_field.dart';
import 'package:notes/widgets/label_screen/delete_dialog.dart';
class EditLabelField extends StatefulWidget {
  final Label label;
  final int index;
  final Animation<double> animation;
  const EditLabelField({super.key,required this.label,required this.index, required this.animation});
  @override
  State<EditLabelField> createState() => _EditLabelFieldState();
}
class _EditLabelFieldState extends State<EditLabelField> {
  late final  GlobalKey<FormState> _formKey;
  late final TextEditingController _controller;
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
    _controller =TextEditingController(text:widget.label.name);
    text = _controller.text;
    _edited = false;
  }
  @override
  void dispose() {
    _focusNode.dispose();
    _focusNode.removeListener(_listen);
    super.dispose();
  }

  _edit() {
    if (text.trim() == _controller.text.trim()) {
      _focusNode.unfocus();
    } else {
      bool found = LabelActionsBloc.of(context).checkFound(_controller.text);
      _found = found;
      bool validate = _formKey.currentState!.validate();
      if (validate) {
        if (_controller.text.isNotEmpty) {
          LabelActionsBloc.of(context).add(EditLabelEvent(widget.label, _controller.text));
          _edited = true;
          _focusNode.unfocus();
        }
      }
    }
  }

  _listen() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
      if (!_isFocused && !_edited) {
        _controller.text = text;
        _formKey.currentState!.reset();
        _edited = false;
        _found = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: widget.animation,
      child: FadeTransition(
        opacity: widget.animation,
        child: LabelField(
            focusNode: _focusNode,
            formKey: _formKey,
            isFocused: _isFocused,
            requestFocus: _focusNode.requestFocus,
            controller: _controller,
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
            deleteLabel: () {
              _focusNode.unfocus();
              showDialog(
                context: context,
                builder: (_) {
                  return BlocProvider.value(
                    value: LabelActionsBloc.of(context),
                    child: DeleteDialog(
                        delete: () {
                          LabelActionsBloc.of(context).add(DeleteLabelEvent(widget.label,index:widget.index));
                          context.pop();
                        }),
                  );
                },
              );
            }),
      ),
    );
  }
}