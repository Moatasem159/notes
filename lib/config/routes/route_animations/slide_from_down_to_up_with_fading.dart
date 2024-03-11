import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideFromDownToUpWithFading extends CustomTransitionPage {
  SlideFromDownToUpWithFading({required super.child})
      : super(
    transitionDuration: const Duration(milliseconds: 500),
    reverseTransitionDuration: const Duration(milliseconds: 500),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      Tween<Offset>slide = Tween(begin: const Offset(0, 1), end: const Offset(0, 0));
      Tween<double>fade = Tween(begin: 0, end: 1);
      CurvedAnimation slideCurve = CurvedAnimation(parent: animation, curve: Curves.fastEaseInToSlowEaseOut);
      CurvedAnimation fadeCurve = CurvedAnimation(parent: animation, curve: Curves.fastEaseInToSlowEaseOut);
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