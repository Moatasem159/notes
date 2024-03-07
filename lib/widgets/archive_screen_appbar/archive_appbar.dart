import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/core/utils/app_text_styles.dart';
import 'package:notes/cubits/app_bar_cubit/app_bar_cubit.dart';
import 'package:notes/models/note.dart';
import 'package:notes/widgets/custom_icon_button.dart';
import 'package:notes/widgets/default_options_appbar/default_options_appbar.dart';
import 'package:notes/widgets/switch_list_view_button.dart';

part 'default_archive_appbar.dart';

class ArchiveAppbar extends StatelessWidget {
  const ArchiveAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBarCubit, AppBarStates>(
      builder: (context, state) {
        return SliverAppBar(
          floating: true,
          pinned:!AppBarCubit.of(context).isBase,
          titleSpacing: 0,
          expandedHeight: 60,
          collapsedHeight: 60,
          toolbarHeight: 60,
          automaticallyImplyLeading: false,
          backgroundColor: AppBarCubit.of(context).isBase?Colors.transparent:context.theme.colorScheme.onSecondary,
          flexibleSpace: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: AppBarCubit.of(context).isBase
                ? const _DefaultArchiveAppbar()
                : const DefaultOptionsAppBar(noteStatus: NoteStatus.archive),
          ),
        );
      },
    );
  }
}
