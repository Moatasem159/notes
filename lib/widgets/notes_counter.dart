import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/core/utils/app_text_styles.dart';
import 'package:notes/cubits/app_bar_cubit/app_bar_cubit.dart';
class NotesCounter extends StatelessWidget {
  const NotesCounter({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBarCubit, AppBarStates>(
      builder: (context, state) {
        return Text(AppBarCubit.of(context).selectedNotes.length.toString(),
            style: AppStyles.styleSemiBold24(context));
      },
    );
  }
}