import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/core/extension/empty_padding_extension.dart';
import 'package:notes/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes/widgets/add_note_screen/add_note_screen_body/note_label_list.dart';
import 'package:notes/widgets/custom_icon_button.dart';
import 'package:notes/widgets/custom_text_form_field.dart';
import 'package:notes/widgets/toast/custom_toast.dart';
part 'note_fields.dart';
part 'image_widget.dart';
class AddNoteScreenBody extends StatelessWidget {
  const AddNoteScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ImageWidget(),
        NoteFields(),
        NoteLabelList()
      ],
    );
  }
}