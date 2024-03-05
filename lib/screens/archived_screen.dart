import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notes/widgets/empty_body.dart';
import 'package:notes/config/themes/app_theme.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/widgets/custom_drawer/main_drawer.dart';
import 'package:notes/widgets/archive_screen_appbar/archive_appbar.dart';
class ArchivedScreen extends StatelessWidget {
  const ArchivedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: AppTheme.systemUiOverlayStyle(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: context.scaffoldBackground,
          drawer: const MainDrawer(),
          body: CustomScrollView(
            scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
            slivers: [
              const ArchiveAppbar(),
              EmptyBody(title: context.local.archiveBodyTitle, icon: Icons.archive_outlined)
            ],
          ),
        ),
      ),
    );
  }
}