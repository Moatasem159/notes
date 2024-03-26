part of 'drawer_cubit.dart';
sealed class DrawerStates {
  const DrawerStates();
}
final class GetLabelsSuccessState extends DrawerStates {
  final List<Label> labels;
  const GetLabelsSuccessState(this.labels);
}
final class EmptyLabelsState extends DrawerStates {
  const EmptyLabelsState();
}