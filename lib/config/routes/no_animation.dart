part of'app_routes.dart';
class NoAnimationRoute extends PageRouteBuilder {
  NoAnimationRoute({
    super.settings,
    required super.pageBuilder,
    super.transitionDuration = const Duration(milliseconds: 200),
    super.reverseTransitionDuration = const Duration(milliseconds: 200),
  }) : super(
            transitionsBuilder: (
          context,
          animation,
          secondaryAnimation,
          child,
        ) =>child);
}
