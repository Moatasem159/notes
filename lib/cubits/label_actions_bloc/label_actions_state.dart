part of 'label_actions_bloc.dart';
abstract class LabelActionsStates {}
class LabelActionsInitialState extends LabelActionsStates {}
class GetLabelsState extends LabelActionsStates {}
class AddLabelLoadingState extends LabelActionsStates {}
class AddLabelSuccessState extends LabelActionsStates {}
class DeleteLabelLoadingState extends LabelActionsStates {}
class DeleteLabelSuccessState extends LabelActionsStates {}
class EditLabelLoadingState extends LabelActionsStates {}
class EditLabelSuccessState extends LabelActionsStates {}
