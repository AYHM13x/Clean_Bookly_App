import 'package:flutter/material.dart';

import '../../../../../../constents.dart';
import '../../../../../../core/utils/styles.dart';
import 'rating_of_book_item.dart';

class PriceAndRateOfBookItem extends StatelessWidget {
  const PriceAndRateOfBookItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "19.99$kEuroSympol",
          style: Styles.textStyle20,
        ),
        Spacer(),
        SizedBox(
          width: 6,
        ),
        RatingOfBookItem(),
      ],
    );
  }
}
