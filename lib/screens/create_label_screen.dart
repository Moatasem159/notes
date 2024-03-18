import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/app/injection_container.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/cubits/label_actions_bloc/label_actions_bloc.dart';
import 'package:notes/widgets/create_label_screen/create_label_screen_body.dart';
class CreateLabelScreen extends StatelessWidget {
  final bool isNew;
  const CreateLabelScreen({super.key, required this.isNew});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LabelActionsBloc(sl())..add(GetLabelsEvent()),
      child: Scaffold(
        backgroundColor: context.scaffoldBackground,
        body: CreateLabelScreenBody(isNew: isNew),
      ),
    );
  }
}