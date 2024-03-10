part of'note_widget.dart';
class _NoteLabelList extends StatelessWidget {
  final List<Label>labels;
  const _NoteLabelList(this.labels);

  @override
  Widget build(BuildContext context) {
    if(labels.length<3) {
      return Wrap(
        spacing: 10,
        runSpacing: 10,
        children:labels
            .map((e) => LabelWidget(label: e, tapped: false))
            .toList(),
      );
    }
    else{
      return Wrap(
          spacing: 10,
          runSpacing: 10,
          children:[
            LabelWidget(label: labels[0], tapped:false),
            LabelWidget(label: labels[1], tapped:false),
            LabelWidget(label: null, tapped:false,count: labels.length-2),
          ]
      );
    }
  }
}