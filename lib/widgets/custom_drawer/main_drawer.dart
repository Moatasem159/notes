import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes/config/routes/app_routes.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/core/extension/empty_padding_extension.dart';
import 'package:notes/core/utils/app_text_styles.dart';
import 'package:notes/models/drawer_item_model.dart';
part 'drawer_builder.dart';
part 'drawer_title.dart';
part 'drawer_tiles_list.dart';
part 'drawer_tile.dart';
class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: context.width/1.16,
      child: const _DrawerBuilder(),
    );
  }
}
