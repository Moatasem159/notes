import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/core/image/image_helper.dart';
import 'package:notes/core/notification/app_notification.dart';
import 'package:notes/cubits/get_active_notes_cubit/get_active_notes_cubit.dart';
import 'package:notes/cubits/get_archived_notes_cubit/get_archived_notes_cubit.dart';
import 'package:notes/cubits/get_deleted_notes_cubit/get_deleted_notes_cubit.dart';
import 'package:notes/cubits/get_labeled_notes_cubit/get_labeled_notes_cubit.dart';
import 'package:notes/cubits/search_cubit/search_cubit.dart';
import 'package:notes/models/label.dart';
import 'package:notes/models/note.dart';
import 'package:notes/sources/notes_data_source.dart';
import 'package:notes/widgets/toast/custom_toast.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteStates> {
  AddNoteCubit(this._dataSource,
      {required this.note,
      required this.noteStatus,
      required this.label,
      required this.isSearch})
      : super(AddNoteInitialState()) {
    isNew = note == null ? true : false;
    note ??= Note(
        date: DateTime.now().toIso8601String(),
        color: Colors.transparent.value,
        labeled: label != null ? true : false,
        labels: label == null ? [] : [label!]);
    noteStatus ??= NoteStatus.active;
    title = TextEditingController(text: note!.title);
    content = TextEditingController(text: note!.note);
    restored = !(note!.status == NoteStatus.deleted);
  }

  static AddNoteCubit of(BuildContext context) => BlocProvider.of(context);
  late final TextEditingController title;
  final NoteLocalDataSource _dataSource;
  late final TextEditingController content;
  Note? note;
  Label? label;
  NoteStatus? noteStatus;
  late bool restored;
  late bool isNew;
  final bool isSearch;

  Future<void> addNote() async {
    emit(AddNoteLoadingState());
    if (note!.isEmpty()) {
      return emit(AddNoteSuccessState(false));
    }
    int result = await _dataSource.addNote(note!);
    if (result != -1) {
      emit(AddNoteSuccessState(true));
    } else {
      emit(AddNoteErrorState());
    }
  }

  Future<void> editNote() async {
    note!.date = DateTime.now().toIso8601String();
    note!.save();
    emit(EditNoteSuccessState());
  }

  changeColor(int value) {
    note!.color = value;
    emit(ChangeColorState());
  }

  changeArchiveNote() {
    if (note!.status == NoteStatus.archive) {
      note!.status = NoteStatus.active;
    } else if (note!.status == NoteStatus.active) {
      note!.status = NoteStatus.archive;
      note!.pinned = false;
    }
    emit(ChangeNoteStatusState());
  }

  setReminder() {
    emit(SetReminderState());
  }

  changePinNote() {
    note!.pinned = !note!.pinned;
    if (note!.pinned) {
      note!.status = NoteStatus.active;
    }
    emit(ChangePinNoteState());
  }

  pickLabel(List<Label> labels) {
    if (labels.isNotEmpty) {
      note!.labels.clear();
      note!.labels.addAll(labels);
      note!.labeled = true;
    }
    if (labels.isEmpty) {
      note!.labels.clear();
      note!.labeled = false;
    }
    emit(PickLabelState());
  }

  restoreNote() {
    note!.status = NoteStatus.active;
    restored = true;
    emit(RestoreNoteState());
  }

  deleteForever() {
    if (note!.imagePath != '') {
      ImageHelper.deleteImageFile(note!.imagePath);
    }
    note!.delete();
    emit(DeleteNoteForeverState());
  }

  deleteNote() {
    if (!isNew) {
      note!.pinned = false;
      note!.status = NoteStatus.deleted;
      note!.save();
    } else {
      note!.clear();
    }
    emit(DeleteNoteState());
  }

  Future<void> getImage(ImageSource imageSource) async {
    note!.imagePath = await ImageHelper.pickImage(imageSource);
    emit(PickImageState());
  }

  removeImage() {
    ImageHelper.deleteImageFile(note!.imagePath);
    note!.imagePath = '';
    emit(RemoveImageState());
  }

  absorb(BuildContext context) {
    if (restored == false) {
      CustomToast.showToast(context, msg: context.local.canNotEdit);
    } else {
      null;
    }
  }

  listen(BuildContext context, AddNoteStates state) {
    if (state is DeleteNoteState) {
      Navigator.of(context).pop();
      if (noteStatus == NoteStatus.archive) {
        GetArchivedNotesCubit.of(context).getArchivedNotes(edit: true);
      } else {
        GetActiveNotesCubit.of(context).getNotes(edit: true);
      }
    }
    if (state is ChangeNoteStatusState) {
      context.pop();
      if (noteStatus == NoteStatus.archive) {
        if (isSearch) {
          SearchCubit.of(context).search(edit: true);
        }
        GetArchivedNotesCubit.of(context).getArchivedNotes(edit: true);
      } else if (noteStatus == NoteStatus.active) {
        if (isSearch) {
          SearchCubit.of(context).search(edit: true);
        }
        GetActiveNotesCubit.of(context).getNotes(edit: true);
      }
    }
    if (state is AddNoteSuccessState && state.isAdded) {
      if (note!.reminderDate!=null) {
        DateTime date=note!.reminderDate!;
        TimeOfDay time=note!.reminderTime!;
        NotificationManager.createNotification(
          context,
          content: NotificationContent(
            id: note!.key,
            title: note?.title,
            body: note?.note,
            bigPicture: note?.imagePath,
            displayOnBackground: true,
            displayOnForeground: true,
            color:Color(note?.color??0x00000000),
            notificationLayout: NotificationLayout.Default,
            payload:note!.toMap(),
            channelKey: NotificationsConstants.channelKey,
          ),
          schedule: NotificationCalendar(
            day: date.day,
            month: date.month,
            year: date.year,
            minute: time.minute,
            hour: date.hour,
          )
        );
      }
      if (noteStatus == NoteStatus.active) {
        GetActiveNotesCubit.of(context).getNotes();
      }
      if (noteStatus == NoteStatus.labeled) {
        GetLabeledNotesCubit.of(context).getLabeledNotes();
      }
    }
    if (state is RestoreNoteState) {
      CustomToast.showToast(context, msg: context.local.noteRestored);
    }
    if (state is EditNoteSuccessState && noteStatus == NoteStatus.archive) {
      GetArchivedNotesCubit.of(context).getArchivedNotes(edit: true);
    }
    if (state is EditNoteSuccessState && noteStatus == NoteStatus.labeled) {
      GetLabeledNotesCubit.of(context).getLabeledNotes(edit: true);
    }
    if (state is EditNoteSuccessState && noteStatus == NoteStatus.active) {
      GetActiveNotesCubit.of(context).getNotes(edit: true);
    }
    if (state is EditNoteSuccessState && noteStatus == NoteStatus.deleted) {
      GetDeletedNotesCubit.of(context).getDeletedNotes(edit: true);
    }
    if (state is DeleteNoteForeverState) {
      GetDeletedNotesCubit.of(context).getDeletedNotes(edit: true);
      Navigator.of(context).pop();
    }
  }

}
