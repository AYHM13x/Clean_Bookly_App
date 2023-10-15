import 'package:bookly_app/constents.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/dimensions_of_screen.dart';
import '../../../../../core/utils/styles.dart';
import '../widgets/Custom_widgets/custom_home_app_bar.dart';
import '../widgets/newest_free_books_list_view.dart';
import '../widgets/book_cards_home_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //fixed app bar
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: DimensionsOfScreen.dimensionsOfWidth(context, 2),
          ),
          child: CustomHomeAppBar(
            image: AssetsData.logo,
            onPressedAppBar: () {
              GoRouter.of(context).push(AppRouter.searchViewPath);
            },
          ),
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
                    const BookCardsHomeListView(),
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
                child: NewestFreeBooksListView(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
