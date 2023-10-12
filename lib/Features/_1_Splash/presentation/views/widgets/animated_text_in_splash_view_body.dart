import 'package:flutter/material.dart';

class AnimatedTextInSplashViewBody extends StatelessWidget {
  const AnimatedTextInSplashViewBody({
    super.key,
    required this.slidingUpAnimation,
  });

  final Animation<Offset> slidingUpAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slidingUpAnimation,
        builder: (context, _) {
          return SlideTransition(
            position: slidingUpAnimation,
            child: const Text(
              "Read Books for Free",
              textAlign: TextAlign.center,
            ),
          );
        });
  }
}
