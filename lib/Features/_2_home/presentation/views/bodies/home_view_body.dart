import 'package:bookly_app/constents.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/dimensions_of_screen.dart';
import '../../../../../core/utils/styles.dart';
import '../../manager/all_free_books_cubit/all_free_books_cubit.dart';
import '../../manager/newest_free_books_cubit/newest_free_books_cubit.dart';
import '../widgets/Custom_widgets/custom_home_app_bar.dart';
import '../widgets/newest_free_books_list_view_bloc_builder.dart';
import '../widgets/book_cards_home_list_view_bloc_builder.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    BlocProvider.of<AllFreeBooksCubit>(context).fetchFreeBooks();
    BlocProvider.of<NewestFreeBooksCubit>(context)
        .fetchNewestBooks(entry: kNewestFreeBooks);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //fixed app bar
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: DimensionsOfScreen.dimensionsOfWidth(context, 2),
          ),
          child: const CustomHomeAppBar(),
        ),
        SizedBox(
          height: DimensionsOfScreen.dimensionsOfHeight(context, 88),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const BookCardsHomeListViewBlocBuilder(),
                    const SizedBox(
                      height: 36,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal:
                            DimensionsOfScreen.dimensionsOfWidth(context, 2),
                      ),
                      child: Text(
                        "Newest Free Books of ${kNewestFreeBooks[0].toUpperCase()}${kNewestFreeBooks.substring(1)}:",
                        style: Styles.textStyle18,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
              const SliverToBoxAdapter(
                child: NewestFreeBooksListViewBlocBuilder(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
