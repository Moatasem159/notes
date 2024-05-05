import 'package:flutter/material.dart';
import 'package:notes/widgets/empty_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/widgets/custom_scroll_list.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/cubits/search_cubit/search_cubit.dart';
import 'package:notes/widgets/note_lists/list_title.dart';
import 'package:notes/widgets/note_lists/notes_list.dart';
import 'package:notes/widgets/note_widget/note_widget.dart';
part 'search_normal_notes_list.dart';
part 'search_archived_list_title.dart';
part 'search_archived_notes_list.dart';
part 'empty_search.dart';
class SearchScreenBody extends StatelessWidget {
  const SearchScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    return const CustomScrollList(
      slivers: [
        _SearchNormalNotesList(),
        _SearchArchivedListTitle(),
        _SearchArchivedNotesList(),
        _EmptySearch()
      ],
    );
  }
}