part of 'create_label_cubit.dart';
abstract class CreateLabelStates {}
class CreateLabelInitialState extends CreateLabelStates {}
class GetLabelsState extends CreateLabelStates {}
class AddLabelLoadingState extends CreateLabelStates {}
class DeleteLabelLoadingState extends CreateLabelStates {}
class DeleteLabelSuccessState extends CreateLabelStates {}
class AddLabelSuccessState extends CreateLabelStates {}
class EditLabelSuccessState extends CreateLabelStates {}
class AddLabelErrorState extends CreateLabelStates {}
