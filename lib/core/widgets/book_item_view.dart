import 'package:flutter/material.dart';

import '../../../../../../core/utils/dimensions_of_screen.dart';
import 'delails_of_book_item.dart';
import 'image_of_book_item.dart';

class BookItemView extends StatelessWidget {
  const BookItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          const ImageBookItem(),
          SizedBox(
            width: DimensionsOfScreen.dimensionsOfWidth(context, 5),
          ),
          const DetailsBookItem(),
        ],
      ),
    );
  }
}
