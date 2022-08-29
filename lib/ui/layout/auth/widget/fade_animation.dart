import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeAnimation(this.delay, this.child);

  @override
  Widget build(BuildContext context) {
    return CustomAnimationBuilder<double>(
      tween: Tween<double>(begin: -90.0, end: 0.0),
      duration: const Duration(seconds: 2),
      child: child,
      builder: (context, value, child) {
        // moves child from left to right
        return Transform.translate(
          offset: Offset(0, value),
          child: child,
        );
      },
    );
  }
}
