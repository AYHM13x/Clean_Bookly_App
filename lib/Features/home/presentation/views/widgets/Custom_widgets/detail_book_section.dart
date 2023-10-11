import 'package:flutter/material.dart';

import '../../../../../../core/utils/dimensions_of_screen.dart';
import 'book_card_item.dart';
import 'pay_and_free_preview_buttons.dart';
import 'text_of_detail_of_book_view.dart';

class DetailBookSection extends StatelessWidget {
  const DetailBookSection({super.key});

  @override
  Widget build(BuildContext context) {
    double width40 = DimensionsOfScreen.dimensionsOfWidth(context, 40);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 33,
        ),
        SizedBox(
          width: width40,
          child: const BookCardItemView(),
        ),
        const SizedBox(
          height: 45,
        ),
        //Text of detail in book view
        const TextOfDetailOfBookView(),
        const SizedBox(
          height: 37,
        ),
        //Pay and Preview buttons
        SizedBox(
          width: DimensionsOfScreen.dimensionsOfWidth(context, 75),
          child: const PayAndFreePreviewButtons(),
        ),
      ],
    );
  }
}
