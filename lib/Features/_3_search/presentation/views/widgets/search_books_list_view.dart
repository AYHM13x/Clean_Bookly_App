import 'package:bookly_app/Features/_2_home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../core/utils/app_router.dart';
import '../../../../../core/widgets/book_item_view.dart';

class BookListView extends StatelessWidget {
  const BookListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: 20,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: GestureDetector(
            onTap: () {
              debugPrint(index.toString());
              // Get.to(() => const BookDetailsView(),
              //     transition: Transition.fadeIn,
              //     duration: kNavigationToNextView);
              GoRouter.of(context).push(AppRouter.bookDetailsViewPath);
            },
            child: BookItemView(
              book: BookEntity(
                  bookId: "0",
                  image: "",
                  title: "",
                  autherName: "",
                  price: 0.0,
                  rating: 0.0,
                  ratingCount: 0),
            ),
          ),
        );
      },
    );
  }
}
