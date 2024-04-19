import 'package:flutter/material.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/widgets/search_screen/search_screen_body.dart';
class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: const SearchScreenBody(),
    );
  }
}