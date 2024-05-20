part of'note_widget.dart';
class _NoteLabelList extends StatelessWidget {
  final List<Label>labels;
  final DateTime ?reminderDate;
  final TimeOfDay ?reminderTime;
  const _NoteLabelList(this.labels, this.reminderDate, this.reminderTime);
  @override
  Widget build(BuildContext context) {
    if(labels.length<3) {
      return Wrap(
        spacing: 10,
        runSpacing: 10,
        children:[
          if(reminderDate!=null)
          ReminderWidget(tapped: false, date:reminderDate!, time:reminderTime!),
          for (var label in labels)
            LabelWidget(label:label,tapped: false)
        ]
      );
    }
    else{
      return Wrap(
          spacing: 10,
          runSpacing: 10,
          children:[
            if(reminderDate!=null)
            ReminderWidget(tapped: false, date:reminderDate!, time:reminderTime!),
            LabelWidget(label: labels[0], tapped:false),
            LabelWidget(label: labels[1], tapped:false),
            LabelWidget(label: null, tapped:false,count: labels.length-2),
          ]
      );
    }
  }
}