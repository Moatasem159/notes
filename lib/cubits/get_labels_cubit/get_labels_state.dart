part of 'get_labels_cubit.dart';
abstract class GetLabelsStates {}
class GetLabelsInitialState extends GetLabelsStates {}
class GetLabelsSuccessState extends GetLabelsStates {
  final List<Label> labels;
  GetLabelsSuccessState(this.labels);
}
