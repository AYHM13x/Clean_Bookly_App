import 'package:bookly_app/Features/_2_home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';

import '../../../../../../constents.dart';
import '../../../../../../core/utils/styles.dart';
import 'price_and_rating_of_book_item.dart';

class DetailsBookItem extends StatelessWidget {
  const DetailsBookItem({
    super.key,
    required this.book,
  });
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            book.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Styles.textStyle20.copyWith(
              fontFamily: kGTSectraFine,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Opacity(
            opacity: .7,
            child: Text(
              book.autherName ?? "there are no authers",
              style: Styles.textStyle14.copyWith(
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          PriceAndRateOfBookItem(
            book: book,
          ),
        ],
      ),
    );
  }
}
