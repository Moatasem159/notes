part of'label_actions_bloc.dart';
abstract class LabelActionsEvents{}
class GetLabelsEvent extends LabelActionsEvents{}
class AddLabelEvent extends LabelActionsEvents{
  final String label;
  AddLabelEvent(this.label);
}
class DeleteLabelEvent extends LabelActionsEvents{
  final Label label;
  DeleteLabelEvent(this.label);
}