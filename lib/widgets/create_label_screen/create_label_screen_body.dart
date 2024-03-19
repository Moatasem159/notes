import 'package:flutter/material.dart';
import 'package:notes/widgets/app_sliver_appbar.dart';
import 'package:notes/widgets/create_label_screen/create_label_field.dart';
import 'package:notes/widgets/create_label_screen/label_list.dart';
import 'package:notes/widgets/custom_scroll_list.dart';
class CreateLabelScreenBody extends StatelessWidget {
  final bool isNew;
  const CreateLabelScreenBody({super.key, required this.isNew});
  @override
  Widget build(BuildContext context) {
    return CustomScrollList(
      slivers: [
        const AppSliverAppbar(),
        SliverToBoxAdapter(
          child: AddLabelField(
            isNew: isNew,
          ),
        ),
        const LabelsList()
      ],
    );
  }
}