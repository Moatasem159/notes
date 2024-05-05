import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notes/config/themes/app_theme.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/widgets/search_screen/search_screen_body.dart';
class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: AppTheme.systemUiOverlayStyle(context).copyWith(
        statusBarColor: context.theme.colorScheme.onSecondary
      ),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: Scaffold(
            backgroundColor: context.theme.scaffoldBackgroundColor,
            appBar: const SearchScreenAppBar(),
            body: const SearchScreenBody(),
          ),
        ),
      ),
    );
  }
}