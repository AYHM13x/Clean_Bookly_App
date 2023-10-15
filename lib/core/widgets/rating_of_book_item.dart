import 'package:bookly_app/Features/_2_home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../core/utils/assets.dart';
import '../../../../../../core/utils/styles.dart';

class RatingOfBookItem extends StatelessWidget {
  const RatingOfBookItem({super.key, required this.book});

  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          AssetsData.star,
          height: 13,
          width: 13,
        ),
        const SizedBox(
          width: 6,
        ),
        Text(
          book.rating != 0.0 ? book.rating.toString() : "??",
          style: Styles.textStyle16,
        ),
        const SizedBox(
          width: 6,
        ),
        Opacity(
          opacity: 0.5,
          child: Text(
            book.ratingCount != 0 ? "(${book.ratingCount.toString()})" : "(??)",
            style: Styles.textStyle14.copyWith(
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
