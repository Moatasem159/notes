part of 'get_labels_cubit.dart';
abstract class GetLabelsStates {}
class GetLabelsInitialState extends GetLabelsStates {}
class GetLabelsSuccessState extends GetLabelsStates {}
class PickLabelsLoadingState extends GetLabelsStates {}
class PickLabelsSuccessState extends GetLabelsStates {}
class PickLabelsForNoteSuccessState extends GetLabelsStates {}