import 'package:bookly_app/core/utils/dimensions_of_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import 'Custom_widgets/book_card_item.dart';

class BookCardsHomeListView extends StatelessWidget {
  const BookCardsHomeListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: DimensionsOfScreen.dimensionsOfHeight(context, 33.33333333),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 20,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: GestureDetector(
              onTap: () {
                debugPrint(index.toString());
                GoRouter.of(context).push(AppRouter.bookDetailsViewPath);
              },
              child: const BookCardItemView(),
            ),
          );
        },
      ),
    );
  }
}
