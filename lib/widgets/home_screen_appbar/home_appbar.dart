import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/core/utils/app_text_styles.dart';
import 'package:notes/cubits/app_bar_cubit/app_bar_cubit.dart';
import 'package:notes/models/note.dart';
import 'package:notes/widgets/custom_icon_button.dart';
import 'package:notes/widgets/default_options_appbar/default_options_appbar.dart';
import 'package:notes/widgets/switch_list_view_button.dart';
part 'default_home_appbar.dart';
class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBarCubit, AppBarStates>(
      builder: (context, state) {
        return  SliverAppBar(
          expandedHeight: 65,
          pinned:!AppBarCubit.of(context).isBase,
          collapsedHeight: 65,
          automaticallyImplyLeading: false,
          backgroundColor: AppBarCubit.of(context).isBase?Colors.transparent:context.theme.colorScheme.onSecondary,
          floating: true,
          flexibleSpace: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: AppBarCubit.of(context).isBase?const _DefaultHomeAppbar():const DefaultOptionsAppBar(noteStatus:NoteStatus.active),
          ),
        );
      },
    );
  }
}
