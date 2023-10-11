import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constents.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/assets.dart';
import '../widgets/animated_text_in_splash_view_body.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingUpAnimation;

  @override
  void initState() {
    super.initState();

    initSildingText();

    navigateToHomeView();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssetsData.logo),
        const SizedBox(
          height: 4,
        ),
        AnimatedTextInSplashViewBody(slidingUpAnimation: slidingUpAnimation),
      ],
    );
  }

  void initSildingText() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    slidingUpAnimation =
        Tween<Offset>(begin: const Offset(0, 20), end: Offset.zero)
            .animate(animationController);

    animationController.forward();
  }

  void navigateToHomeView() {
    Future.delayed(kDelayedDuration, () {
      GoRouter.of(context).push(AppRouter.homeViewPath);
    });
  }
}
