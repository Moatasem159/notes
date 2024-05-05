part of 'app_routes.dart';
class SlideFromDownToUpWithFading extends PageRouteBuilder {
  SlideFromDownToUpWithFading({
    super.settings,
    required super.pageBuilder,
    super.transitionDuration = const Duration(milliseconds: 500),
    super.reverseTransitionDuration = const Duration(milliseconds: 500),
  }) : super(
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            Tween<Offset> slide =
                Tween(begin: const Offset(0, 1), end: const Offset(0, 0));
            Tween<double> fade = Tween(begin: 0, end: 1);
            CurvedAnimation slideCurve = CurvedAnimation(
                parent: animation, curve: Curves.fastEaseInToSlowEaseOut);
            CurvedAnimation fadeCurve = CurvedAnimation(
                parent: animation, curve: Curves.fastEaseInToSlowEaseOut);
            return SlideTransition(
              position: slide.animate(slideCurve),
              child: FadeTransition(
                opacity: fade.animate(fadeCurve),
                child: child,
              ),
            );
          },
        );
}