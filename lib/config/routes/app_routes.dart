import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes/cubits/get_active_notes_cubit/get_active_notes_cubit.dart';
import 'package:notes/cubits/get_archived_notes_cubit/get_archived_notes_cubit.dart';
import 'package:notes/cubits/get_deleted_notes_cubit/get_deleted_notes_cubit.dart';
import 'package:notes/cubits/get_labeled_notes_cubit/get_labeled_notes_cubit.dart';
import 'package:notes/models/create_label_params.dart';
import 'package:notes/models/label.dart';
import 'package:notes/models/note.dart';
import 'package:notes/screens/deleted_screen.dart';
import 'package:notes/screens/home_screen.dart';
import 'package:notes/screens/label_screen.dart';
import 'package:notes/screens/pick_label_screen.dart';
import 'package:notes/screens/reminder_screen.dart';
import 'package:notes/screens/settings_screen.dart';
import 'package:notes/models/pick_label_params.dart';
import 'package:notes/screens/archived_screen.dart';
import 'package:notes/screens/create_label_screen.dart';
abstract class Routes {
  static const String homeRoute = "home";
  static const String reminderRoute = "reminder";
  static const String createLabelRoute = "createLabel";
  static const String pickLabelRoute = "pickLabel";
  static const String labelRoute = "label";
  static const String archivedRoute = "archived";
  static const String deletedRoute = "deleted";
  static const String settingsRoute = "settings";
}
class AppRouter {
  Route router(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const HomeScreen(),
        );
      case Routes.reminderRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const ReminderScreen(),
        );
      case Routes.createLabelRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) {
            CreateLabelParams params = settings.arguments as CreateLabelParams;
            return _getCreateLabelScreen(params);
          },
        );
      case Routes.pickLabelRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) {
            PickLabelParams params = settings.arguments as PickLabelParams;
            return _getPickLabelScreen(params);
          },
        );
      case Routes.labelRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => LabelScreen(label: settings.arguments as Label),
        );
      case Routes.archivedRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const ArchivedScreen(),
        );
      case Routes.deletedRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const DeleteScreen(),
        );
      case Routes.settingsRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const SettingsScreen(),
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const Scaffold(),
        );
    }
  }
  Widget _getCreateLabelScreen(CreateLabelParams params) {
    if (params.notesStatus == NoteStatus.active) {
      return BlocProvider.value(
          value: params.notesCubit as GetActiveNotesCubit,
          child: CreateLabelScreen(params: params));
    }
    if (params.notesStatus == NoteStatus.archive) {
      return BlocProvider.value(
          value: params.notesCubit as GetArchivedNotesCubit,
          child: CreateLabelScreen(params: params));
    }
    if (params.notesStatus == NoteStatus.labeled) {
      return BlocProvider.value(
          value: params.notesCubit as GetLabeledNotesCubit,
          child: CreateLabelScreen(params: params));
    }
    if (params.notesStatus == NoteStatus.deleted) {
      return BlocProvider.value(
          value: params.notesCubit as GetDeletedNotesCubit,
          child: CreateLabelScreen(params: params));
    }
    return CreateLabelScreen(params: params);
  }
  Widget _getPickLabelScreen(PickLabelParams params) {
    switch (params.noteStatus) {
      case NoteStatus.archive:
        if (params.inNote) {
          return BlocProvider.value(
            value: params.notesCubit as GetArchivedNotesCubit,
            child: BlocProvider.value(
              value: params.addNoteCubit as AddNoteCubit,
              child: PickLabelScreen(params: params),
            ),
          );
        } else {
          return BlocProvider.value(
            value: params.notesCubit as GetArchivedNotesCubit,
            child: PickLabelScreen(params: params),
          );
        }
      case NoteStatus.labeled:
        if (params.inNote) {
          return BlocProvider.value(
            value: params.notesCubit as GetLabeledNotesCubit,
            child: BlocProvider.value(
              value: params.addNoteCubit as AddNoteCubit,
              child: PickLabelScreen(params: params),
            ),
          );
        } else {
          return BlocProvider.value(
            value: params.notesCubit as GetLabeledNotesCubit,
            child: PickLabelScreen(params: params),
          );
        }
      default:
        if (params.inNote) {
          return BlocProvider.value(
            value: params.notesCubit as GetActiveNotesCubit,
            child: BlocProvider.value(
              value: params.addNoteCubit as AddNoteCubit,
              child: PickLabelScreen(params: params),
            ),
          );
        } else {
          return BlocProvider.value(
            value: params.notesCubit as GetActiveNotesCubit,
            child: PickLabelScreen(params: params),
          );
        }
    }
  }
}