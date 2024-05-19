import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes/models/note.dart';
import 'package:notes/widgets/label_widget.dart';
import 'package:notes/widgets/reminder_widget.dart';
class NoteLabelList extends StatelessWidget {
  const NoteLabelList({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddNoteCubit, AddNoteStates>(
      builder: (context, state) {
        Note note=AddNoteCubit.of(context).note!;
        return Padding(
          padding: const EdgeInsets.only(left: 10,right: 10,bottom: 40),
          child: Wrap(
            spacing: 10,
              runSpacing: 10,
              children:[
                if(note.reminderDate.isNotEmpty)
                ReminderWidget(tapped: true, date: note.reminderDate, time: note.reminderTime),
                for (var label in note.labels)
                  LabelWidget(label:label,tapped: true)
              ]),
        );
      },
    );
  }
}

