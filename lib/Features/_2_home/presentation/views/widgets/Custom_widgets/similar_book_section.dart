import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/styles.dart';
import '../similar_book_list_view.dart';

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({
    super.key,
    required this.category,
  });
  final String category;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "You can also like ($category):",
          style: Styles.textStyle14.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.whiteColor,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        //list of "You can also like"
        const SimilarBookListView(),
        const SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
