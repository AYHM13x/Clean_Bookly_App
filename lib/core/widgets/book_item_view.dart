import 'package:bookly_app/Features/_2_home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/dimensions_of_screen.dart';
import '../../Features/_2_home/presentation/views/widgets/Custom_widgets/book_card_item.dart';
import 'delails_of_book_item.dart';

class BookItemView extends StatelessWidget {
  const BookItemView({super.key, required this.book});

  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: 105,
            child: BookCardItemView(
              imageUrl: book.image ?? "",
            ),
          ),
          SizedBox(
            width: DimensionsOfScreen.dimensionsOfWidth(context, 5),
          ),
          DetailsBookItem(
            book: book,
          ),
        ],
      ),
    );
  }
}
