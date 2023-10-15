import 'package:bookly_app/Features/_2_home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/styles.dart';
import 'rating_of_book_item.dart';

class PriceAndRateOfBookItem extends StatelessWidget {
  const PriceAndRateOfBookItem({super.key, required this.book});

  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text(
          "Free",
          style: Styles.textStyle20,
        ),
        const Spacer(),
        const SizedBox(
          width: 6,
        ),
        RatingOfBookItem(
          book: book,
        ),
      ],
    );
  }
}
