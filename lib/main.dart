import 'package:bookly_app/Features/_2_home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/Features/_2_home/domain/entities/book_entity.dart';
import 'package:bookly_app/Features/_2_home/domain/use_cases/fetch_free_books_cards.dart';
import 'package:bookly_app/Features/_2_home/domain/use_cases/fetch_newest_free_books.dart';
import 'package:bookly_app/Features/_2_home/presentation/manager/all_free_books_cubit/all_free_books_cubit.dart';
import 'package:bookly_app/Features/_2_home/presentation/manager/newest_free_books_cubit/newest_free_books_cubit.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'constents.dart';
import 'core/utils/app_colors.dart';
import 'core/utils/service_locater.dart';
import 'simple_bloc_observer.dart';

void main() async {
  Bloc.observer = SimpleBlocObserver();

  await initHive();

  runApp(const CleanBooklyApp());
}

class CleanBooklyApp extends StatelessWidget {
  const CleanBooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return AllFreeBooksCubit(
                FetchFreeBooksCardsUseCase(getIt.get<HomeRepoImpl>()))
              ..fetchFreeBooks();
          },
        ),
        BlocProvider(
          create: (context) {
            return NewestFreeBooksCubit(
                FecthNewsestFreeBooksUseCase(getIt.get<HomeRepoImpl>()))
              ..fetchNewestBooks();
          },
        )
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        title: "Clean Bookly App",
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: AppColors.primaryColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}

Future<void> initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(kFreeBooksBox);
  await Hive.openBox<BookEntity>(kFreeNewestBooksBox);
}
