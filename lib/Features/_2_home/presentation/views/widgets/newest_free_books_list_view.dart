import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/widgets/item_view/book_item_view.dart';
import '../../../domain/entities/book_entity.dart';

class NewestFreeBooksListView extends StatelessWidget {
  const NewestFreeBooksListView({
    super.key,
    required this.books,
  });
  final List<BookEntity> books;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: books.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: GestureDetector(
            onTap: () {
              debugPrint(index.toString());
              GoRouter.of(context)
                  .push(AppRouter.bookDetailsViewPath, extra: books[index]);
            },
            child: BookItemView(
              book: books[index],
            ),
          ),
        );
      },
    );
  }
}
