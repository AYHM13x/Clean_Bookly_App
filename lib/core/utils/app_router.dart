import 'package:bookly_app/Features/_2_home/domain/entities/book_entity.dart';
import 'package:bookly_app/Features/_2_home/domain/use_cases/fetch_similar_books.dart';
import 'package:bookly_app/Features/_2_home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/core/utils/service_locater.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../Features/_1_Splash/presentation/views/splash_view.dart';
import '../../Features/_2_home/data/repos/home_repo_impl.dart';
import '../../Features/_2_home/presentation/book_details_view.dart';
import '../../Features/_2_home/presentation/edit_entry_view.dart';
import '../../Features/_2_home/presentation/home_view.dart';
import '../../Features/_3_search/presentation/views/search_view.dart';

abstract class AppRouter {
  //Paths
  static String splashViewPath = "/";
  static String homeViewPath = "/homeView";
  static String bookDetailsViewPath = "/homeView/bookDetailsView";
  static String editEntryViewPath = "/homeView/editEntryView";
  static String searchViewPath = "/homeView/searchView";

  static final RouterConfig<Object> router = GoRouter(
    routes: [
      GoRoute(
        path: splashViewPath,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: homeViewPath,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: bookDetailsViewPath,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => SimilarBooksCubit(
                FetchSimilarBooksUseCase(getIt.get<HomeRepoImpl>())),
            child: BookDetailsView(
              book: state.extra as BookEntity,
            ),
          );
        },
      ),
      GoRoute(
        path: editEntryViewPath,
        builder: (context, state) => const EditEntryView(),
      ),
      GoRoute(
        path: searchViewPath,
        builder: (context, state) => const SearchView(),
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
