import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/app/injection_container.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/cubits/create_label_cubit/create_label_cubit.dart';
import 'package:notes/widgets/create_label_screen/create_label_screen_body.dart';
class CreateLabelScreen extends StatelessWidget {
  final bool isNew;
  const CreateLabelScreen({super.key, required this.isNew});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateLabelCubit(sl())..getLabels(),
      child: Scaffold(
        backgroundColor: context.scaffoldBackground,
        body: CreateLabelScreenBody(isNew: isNew),
      ),
    );
  }
}