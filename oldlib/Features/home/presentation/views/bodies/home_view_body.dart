import 'package:bookly_app/core/utils/dimensions_of_screen.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';
import '../widgets/best_seller_list_view.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/featured_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBar(),
              const FeaturedBooksListView(),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: DimensionsOfScreen.dimensionsOfWidth(context, 2),
                ),
                child: const Text(
                  'Newest Books:',
                  style: Styles.textStyle18,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        const SliverFillRemaining(
          child: BestSellerListView(),
        ),
      ],
    );
  }
}
