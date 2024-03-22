import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:notes/app/injection_container.dart';
import 'package:notes/config/routes/app_routes.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/core/extension/empty_padding_extension.dart';
import 'package:notes/core/utils/app_text_styles.dart';
import 'package:notes/cubits/get_labels_cubit/get_labels_cubit.dart';
import 'package:notes/models/drawer_item_model.dart';
import 'package:notes/models/label.dart';
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
      create: (context) => GetLabelsCubit(sl())..getLabels(),
      child: Drawer(
        width: context.width / 1.16,
        child: const _DrawerBuilder(),
      ),
    );
  }
}
