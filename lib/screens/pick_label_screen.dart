import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/app/injection_container.dart';
import 'package:notes/config/themes/app_theme.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/cubits/pick_labels_cubit/pick_labels_cubit.dart';
import 'package:notes/models/pick_label_params.dart';
import 'package:notes/widgets/pick_label_screen/pick_label_appbar.dart';
import 'package:notes/widgets/pick_label_screen/pick_label_list.dart';
class PickLabelScreen extends StatelessWidget {
  final PickLabelParams params;
  const PickLabelScreen({super.key, required this.params});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PickLabelsCubit(sl(),inNote: params.inNote,noteStatus: params.noteStatus,notes: params.notes, labels: params.labels)..getLabels(),
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: AppTheme.systemUiOverlayStyle(context),
        child: Builder(
          builder: (context) {
            return PopScope(
              onPopInvoked: (didPop) {
                if(!params.inNote) {
                  PickLabelsCubit.of(context).pickLabelsForMultipleNotes();
                }
                else{
                  PickLabelsCubit.of(context).picLabelsForNote();
                }
              },
              child: SafeArea(
                child: Scaffold(
                    appBar: const PickLabelAppbar(),
                    backgroundColor: context.scaffoldBackground,
                    body: const PickLabelsList(),
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}