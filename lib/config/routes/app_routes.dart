import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:notes/cubits/get_labeled_notes_cubit/get_labeled_notes_cubit.dart';
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
import 'package:notes/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes/cubits/get_archived_notes_cubit/get_archived_notes_cubit.dart';
import 'package:notes/config/routes/route_animations/slide_from_down_to_up_with_fading.dart';

abstract class Routes {
  static const String initialRoute = "/";
  static const String homeRoute = "home";
  static const String reminderRoute = "reminder";
  static const String createLabelRoute = "createLabel";
  static const String pickLabelRoute = "pickLabel";
  static const String labelRoute = "label";
  static const String archivedRoute = "archived";
  static const String deletedRoute = "deleted";
  static const String settingsRoute = "settings";
}

abstract class AppRoute {
  static final GoRouter router = GoRouter(
    initialLocation: Routes.initialRoute,
    routes: [
      GoRoute(
          path: Routes.initialRoute,
          name: Routes.homeRoute,
          builder: (_, state) => HomeScreen(key:UniqueKey()),
          routes: <GoRoute>[
            GoRoute(
              path: "reminder",
              name: Routes.reminderRoute,
              builder: (__, _) => const ReminderScreen(),
            ),
            GoRoute(
              path: "label",
              name: Routes.labelRoute,
              pageBuilder: (context, state) => SlideFromDownToUpWithFading(
                  child: LabelScreen(
                key: UniqueKey(),
                label: state.extra as Label,
              )),
            ),
            GoRoute(
              path: 'pickLabel',
              name: Routes.pickLabelRoute,
              builder: (context, state) {
                bool inNote = state.uri.queryParameters["inNote"] == "true" ? true : false;
                String noteStatus=state.uri.queryParameters["noteStatus"]!;
                NoteStatus status = noteStatus == "NoteStatus.active"
                    ? NoteStatus.active : noteStatus == "NoteStatus.labeled"
                    ? NoteStatus.labeled
                    : NoteStatus.archive;
                PickLabelParams params = state.extra as PickLabelParams;
                if (inNote && status == NoteStatus.archive) {
                  return BlocProvider.value(
                    value: params.notesCubit as GetArchivedNotesCubit,
                    child: BlocProvider.value(
                      value: params.addNoteCubit as AddNoteCubit,
                      child: PickLabelScreen(
                        noteStatus: status,
                        inNote: inNote,
                        params: params,
                      ),
                    ),
                  );
                }
                else if (inNote && status != NoteStatus.archive) {
                  return BlocProvider.value(
                    value: params.addNoteCubit as AddNoteCubit,
                    child: PickLabelScreen(
                      noteStatus: status,
                      inNote: inNote,
                      params: params,
                    ),
                  );
                }
                else if (!inNote && status == NoteStatus.archive) {
                  return BlocProvider.value(
                    value: params.notesCubit as GetArchivedNotesCubit,
                    child: PickLabelScreen(
                      noteStatus: status,
                      inNote: inNote,
                      params: params,
                    ),
                  );
                }
                else if (!inNote && status == NoteStatus.labeled) {
                  return BlocProvider.value(
                    value: params.notesCubit as GetLabeledNotesCubit,
                    child: PickLabelScreen(
                      noteStatus: status,
                      inNote: inNote,
                      params: params,
                    ),
                  );
                }
                else {
                  return PickLabelScreen(
                    noteStatus: status,
                    params: state.extra as PickLabelParams,
                  );
                }
              },
            ),
            GoRoute(
              path: "createLabelRoute",
              name: Routes.createLabelRoute,
              builder: (__, state) => CreateLabelScreen(
                isNew:
                    state.uri.queryParameters["isNew"] == "true" ? true : false,
              ),
            ),
            GoRoute(
              path: "archived",
              name: Routes.archivedRoute,
             pageBuilder: (_, __) => SlideFromDownToUpWithFading(child: const ArchivedScreen()),
            ),
            GoRoute(
              path: "deleted",
              name: Routes.deletedRoute,
              builder: (__, _) => const DeleteScreen(),
            ),
            GoRoute(
              path: "settings",
              name: Routes.settingsRoute,
              builder: (__, _) => const SettingsScreen(),
            ),
          ]),

    ],
  );

  static String location() {
    String location = _routerLastMatch().uri.path.replaceFirst("/", '');
    if (location.isEmpty) {
      location = Routes.homeRoute;
    }
    return location;
  }

  static String query() {
    String queryParams = _routerLastMatch().uri.queryParameters.isNotEmpty
        ? _routerLastMatch().uri.queryParameters.values.first
        : '';
    return queryParams;
  }

  static RouteMatchList _routerLastMatch() {
    final RouteMatch lastMatch =
        router.routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : router.routerDelegate.currentConfiguration;
    return matchList;
  }
}
