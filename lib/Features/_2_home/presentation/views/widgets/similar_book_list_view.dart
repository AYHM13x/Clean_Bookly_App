import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/widgets/item_view/book_card_item.dart';
import '../../../domain/entities/book_entity.dart';

class SimilarBookListView extends StatelessWidget {
  const SimilarBookListView({
    super.key,
    required this.books,
  });
  final List<BookEntity> books;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: books.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: GestureDetector(
            onTap: () {
              debugPrint(index.toString());
              // Get.to(() => const BookDetailsView(),
              //     transition: Transition.fadeIn,
              //     duration: kNavigationToNextView);
              GoRouter.of(context)
                  .push(AppRouter.bookDetailsViewPath, extra: books[index]);
            },
            child: BookCardItemView(
              imageUrl: books[index].image ?? "",
            ),
          ),
        );
      },
    );
  }
}
