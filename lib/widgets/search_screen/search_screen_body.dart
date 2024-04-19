import 'package:flutter/material.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/core/utils/app_text_styles.dart';
import 'package:notes/widgets/custom_scroll_list.dart';
part 'search_screen_appbar.dart';
class SearchScreenBody extends StatelessWidget {
  const SearchScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    return const CustomScrollList(
      slivers: [
        _SearchScreenAppBar(),
      ],
    );
  }
}