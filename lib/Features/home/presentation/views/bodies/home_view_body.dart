import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/dimensions_of_screen.dart';
import '../../../../../core/utils/styles.dart';
import '../widgets/Custom_widgets/custom_home_app_bar.dart';
import '../widgets/best_seller_list_view.dart';
import '../widgets/book_cards_home_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              const BookCardsHomeListView(),
              const SizedBox(
                height: 36,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: DimensionsOfScreen.dimensionsOfWidth(context, 2),
                ),
                child: const Text(
                  "Best Seller",
                  style: Styles.textStyle18,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: DimensionsOfScreen.dimensionsOfWidth(context, 2),
            ),
            child: const BestSellerListView(),
          ),
        ),
      ],
    );
  }
}
