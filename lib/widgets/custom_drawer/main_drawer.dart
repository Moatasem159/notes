import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/app/injection_container.dart';
import 'package:notes/config/routes/app_routes.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/core/extension/empty_padding_extension.dart';
import 'package:notes/core/utils/app_text_styles.dart';
import 'package:notes/cubits/drawer_cubit/drawer_cubit.dart';
import 'package:notes/cubits/get_active_notes_cubit/get_active_notes_cubit.dart';
import 'package:notes/cubits/get_archived_notes_cubit/get_archived_notes_cubit.dart';
import 'package:notes/cubits/get_deleted_notes_cubit/get_deleted_notes_cubit.dart';
import 'package:notes/cubits/get_labeled_notes_cubit/get_labeled_notes_cubit.dart';
import 'package:notes/models/create_label_params.dart';
import 'package:notes/models/drawer_item_model.dart';
import 'package:notes/models/label.dart';
import 'package:notes/models/note.dart';
part 'drawer_builder.dart';
part 'labels_tile.dart';
part 'drawer_title.dart';
part 'label_header.dart';
part 'drawer_tile.dart';
part 'labels_list.dart';
part 'label_tile.dart';
part 'drawer_tiles_list.dart';
class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DrawerCubit(sl())..getLabels(),
      child: Drawer(
        width: context.width / 1.16,
        child: const _DrawerBuilder(),
      ),
    );
  }
}
