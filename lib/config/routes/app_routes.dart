import 'package:go_router/go_router.dart';
import 'package:notes/screens/archived_screen.dart';
import 'package:notes/screens/create_label_screen.dart';
import 'package:notes/screens/deleted_screen.dart';
import 'package:notes/screens/home_screen.dart';
import 'package:notes/screens/reminder_screen.dart';
import 'package:notes/screens/settings_screen.dart';
abstract class Routes {
  static const String initialRoute = "/";
  static const String homeRoute = "home";
  static const String reminderRoute = "reminder";
  static const String createLabelRoute = "createLabel";
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
        builder: (__, _) =>const HomeScreen(),
        routes:<GoRoute>[
          GoRoute(
            path: "reminder",
            name: Routes.reminderRoute,
            builder: (__, _) =>const ReminderScreen(),
          ),
          GoRoute(
            path: "createLabelRoute",
            name: Routes.createLabelRoute,
            builder: (__, state) =>CreateLabelScreen(
              edit: state.uri.queryParameters["edit"]=="true"?true:false,
            ),
          ),
          GoRoute(
            path: "archived",
            name: Routes.archivedRoute,
            builder: (__, _) =>const ArchivedScreen(),
          ),
          GoRoute(
            path: "deleted",
            name: Routes.deletedRoute,
            builder: (__, _) =>const DeleteScreen(),
          ),
          GoRoute(
            path: "settings",
            name: Routes.settingsRoute,
            builder: (__, _) =>const SettingsScreen(),
          ),
        ]
      ),

    ],
  );
  static String location() {
    final RouteMatch lastMatch = router.routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch ? lastMatch.matches:router.routerDelegate.currentConfiguration;
    String location = matchList.uri.toString().replaceFirst("/", '');
    if(location.isEmpty)
      {
        location =Routes.homeRoute;
      }
    return location;
  }
}