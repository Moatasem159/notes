part of'label_actions_bloc.dart';
abstract class LabelActionsEvents{}
class GetLabelsEvent extends LabelActionsEvents{}
class AddLabelEvent extends LabelActionsEvents{
  final String label;
  AddLabelEvent(this.label);
}
class DeleteLabelEvent extends LabelActionsEvents{
  final Label label;
  final int ?index;
  DeleteLabelEvent(this.label, {this.index});
}
class EditLabelEvent extends LabelActionsEvents{
  final Label label;
  final String newName;
  EditLabelEvent(this.label,this.newName);
}