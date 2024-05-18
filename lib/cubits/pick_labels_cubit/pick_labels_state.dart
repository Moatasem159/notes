part of 'pick_labels_cubit.dart';
sealed class PickLabelsStates {}
final class GetLabelsInitialState extends PickLabelsStates {}
final class CheckLabelState extends PickLabelsStates {}
final class PickLabelsLoadingState extends PickLabelsStates {}
final class PickLabelsSuccessState extends PickLabelsStates {}
final class PickLabelsForNoteSuccessState extends PickLabelsStates {}