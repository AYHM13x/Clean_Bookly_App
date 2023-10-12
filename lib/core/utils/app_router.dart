import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../Features/_1_Splash/presentation/views/splash_view.dart';
import '../../Features/_2_home/book_details_view.dart';
import '../../Features/_2_home/home_view.dart';
import '../../Features/search/presentation/views/search_view.dart';
import '../../constents.dart';

abstract class AppRouter {
  //Paths
  static String splashViewPath = "/";
  static String homeViewPath = "/homeView";
  static String bookDetailsViewPath = "/homeView/bookDetailsView";
  static String searchViewPath = "/homeView/searchView";

  static final RouterConfig<Object> router = GoRouter(
    routes: [
      GoRoute(
        path: splashViewPath,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: homeViewPath,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const HomeView(),
            transitionDuration: kNavigationToNextView,
            reverseTransitionDuration: kNavigationToNextView,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: CurveTween(curve: Curves.easeIn).animate(animation),
                alwaysIncludeSemantics: true,
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: bookDetailsViewPath,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const BookDetailsView(),
            transitionDuration: kNavigationToNextView,
            reverseTransitionDuration: kNavigationToNextView,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: CurveTween(curve: Curves.easeIn).animate(animation),
                alwaysIncludeSemantics: true,
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: searchViewPath,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const SearchView(),
            transitionDuration: kNavigationToNextView,
            reverseTransitionDuration: kNavigationToNextView,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: CurveTween(curve: Curves.easeIn).animate(animation),
                alwaysIncludeSemantics: true,
                child: child,
              );
            },
          );
        },
      ),
    ],
  );
}

// final _router = GoRouter(
//   routes: [
//     GoRoute(
//       path: '/',
//       builder: (context, state) => const SplashView(),
//     ),
//   ],
// );
