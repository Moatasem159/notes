import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notes/config/themes/app_theme.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/widgets/custom_drawer/main_drawer.dart';
import 'package:notes/widgets/archive_screen_body/archive_screen_body.dart';
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
          body: const ArchiveScreenBody(),
        ),
      ),
    );
  }
}