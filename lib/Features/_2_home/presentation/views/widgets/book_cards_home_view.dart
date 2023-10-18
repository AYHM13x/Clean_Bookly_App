import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/widgets/item_view/book_card_item.dart';
import '../../../domain/entities/book_entity.dart';

class BookCardsHomeListView extends StatelessWidget {
  const BookCardsHomeListView({
    super.key,
    required this.books,
  });
  final List<BookEntity> books;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: books.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: GestureDetector(
            onTap: () {
              debugPrint(index.toString());
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
