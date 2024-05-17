import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/cubits/label_actions_bloc/label_actions_bloc.dart';
import 'package:notes/widgets/create_label_screen/label_field/label_field.dart';
class AddLabelField extends StatefulWidget {
  final bool isNew;
  const AddLabelField({super.key, required this.isNew});
  @override
  State<AddLabelField> createState() => _AddLabelFieldState();
}
class _AddLabelFieldState extends State<AddLabelField> {
  late final TextEditingController _controller;
  late GlobalKey<FormState> _formKey;
  late FocusNode _focusNode;
  late bool _isFocused;
  late bool _found;
  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_listen);
    _isFocused = widget.isNew;
    _formKey = GlobalKey<FormState>();
    _found = false;
    _controller = TextEditingController();
  }
  void _add() {
    bool found=LabelActionsBloc.of(context).checkFound(_controller.text);
    _found=found;
    bool validate=_formKey.currentState!.validate();
    if(validate){
      if(_controller.text.isNotEmpty) {
        LabelActionsBloc.of(context).add(AddLabelEvent(_controller.text));
        _found=false;
      }
      else{
        _focusNode.unfocus();
      }
    }
    else{
      _focusNode.requestFocus();
    }
  }
  _listen() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
      _formKey.currentState!.reset();
      _controller.clear();
    });
  }
  void _toggleFocus() {
    setState(() {
      if (_isFocused) {
        _formKey.currentState!.reset();
        _controller.clear();
        _focusNode.unfocus();
      } else {
        _focusNode.requestFocus();
      }
    });
  }
  @override
  void dispose() {
    _controller.dispose();
    _focusNode.removeListener(_listen);
    _focusNode.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<LabelActionsBloc, LabelActionsStates>(
      listener: (context, state) {
        if (state is AddLabelSuccessState) {
          _controller.clear();
          _focusNode.unfocus();
        }
      },
        child:LabelField(
          formKey: _formKey,
          focusNode: _focusNode,
          toggleFocus: _toggleFocus,
          isNew: widget.isNew,
          adding: true,
          controller: _controller,
          isFocused: _isFocused,
          addLabel:_add,
          onSubmit:_add,
          validate: (value) {
            if (value!.length >= 50) {
              return context.local.enterShorterLabel;
            }
            if (_found) {
              return context.local.labelAlreadyExists;
            }
            return null;
          },
        )
    );
  }
}