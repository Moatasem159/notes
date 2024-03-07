import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/cubits/create_label_cubit/create_label_cubit.dart';
import 'package:notes/models/label.dart';
import 'package:notes/widgets/app_sliver_appbar.dart';
import 'package:notes/widgets/create_label_screen/create_label_field.dart';
import 'package:notes/widgets/custom_scroll_list.dart';
class CreateLabelScreen extends StatelessWidget {
  final bool edit;
  const CreateLabelScreen({super.key, required this.edit});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateLabelCubit(),
      child: Scaffold(
        backgroundColor: context.scaffoldBackground,
        body:  CustomScrollList(
          slivers: [
            const AppSliverAppbar(),
            SliverToBoxAdapter(child: CreateLabelField(isNew: edit)),
            SliverList.builder(
              itemCount: 5,
              itemBuilder: (context, index) => CreateLabelField(label: Label(name: "name"),),)
          ],
        ),
      ),
    );
  }
}