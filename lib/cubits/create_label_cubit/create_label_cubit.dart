import 'package:flutter_bloc/flutter_bloc.dart';
part 'create_label_state.dart';
class CreateLabelCubit extends Cubit<CreateLabelStates> {
  CreateLabelCubit() : super(CreateLabelInitialState());
}
