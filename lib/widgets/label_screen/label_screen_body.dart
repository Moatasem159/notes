import 'package:flutter/material.dart';
import 'package:notes/app/injection_container.dart';
import 'package:notes/cubits/get_labeled_notes_cubit/get_labeled_notes_cubit.dart';
import 'package:notes/cubits/label_actions_bloc/label_actions_bloc.dart';
import 'package:notes/models/note.dart';
import 'package:notes/widgets/empty_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/widgets/custom_button.dart';
import 'package:notes/widgets/custom_icon_button.dart';
import 'package:notes/core/utils/app_text_styles.dart';
import 'package:notes/widgets/custom_scroll_list.dart';
import 'package:notes/widgets/note_lists/notes_list.dart';
import 'package:notes/widgets/note_lists/list_title.dart';
import 'package:notes/widgets/note_widget/note_widget.dart';
import 'package:notes/widgets/switch_list_view_button.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/cubits/app_bar_cubit/app_bar_cubit.dart';
import 'package:notes/core/extension/empty_padding_extension.dart';
import 'package:notes/widgets/custom_popup_menu/custom_popup_menu.dart';
import 'package:notes/widgets/custom_popup_menu/custom_popup_menu_item.dart';
import 'package:notes/widgets/default_options_appbar/default_options_appbar.dart';
part 'rename_label.dart';
part 'label_appbar.dart';
part 'label_popup_menu.dart';
part 'default_label_appbar.dart';
part 'body_widgets/label_empty_body.dart';
part 'body_widgets/pinned_labeled_notes_list.dart';
part 'body_widgets/others_labeled_notes_list.dart';
part 'body_widgets/archived_labeled_notes_list.dart';
part 'body_widgets/pinned_labeled_notes_list_title.dart';
part 'body_widgets/others_labeled_notes_list_title.dart';
part 'body_widgets/archived_labeled_notes_list_title.dart';
class LabelScreenBody extends StatelessWidget {
  const LabelScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    return const CustomScrollList(
      slivers: [
        _LabelAppbar(),
        _PinnedLabeledNotesListTitle(),
        _PinnedLabeledNotesList(),
        _OthersLabeledNotesListTitle(),
        _OthersLabeledNotesList(),
        _ArchivedLabeledNotesListTitle(),
        _ArchivedLabeledNotesList(),
        _LabelEmptyBody()
      ],
    );
  }
}