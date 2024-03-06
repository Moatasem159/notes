import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/cubits/get_active_notes_cubit/get_active_notes_cubit.dart';
import 'package:notes/models/note.dart';
import 'package:notes/widgets/custom_scroll_list.dart';
import 'package:notes/widgets/empty_body.dart';
import 'package:notes/widgets/home_screen_appbar/home_appbar.dart';
import 'package:notes/widgets/note_lists/list_title.dart';
import 'package:notes/widgets/note_lists/notes_list.dart';
part 'home_screen_body_builder.dart';
part 'first_body.dart';
part 'second_body.dart';
part 'third_body.dart';
class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    return const HomeScreenBodyBuilder();
  }
}




