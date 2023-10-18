import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';

import '../../../constents.dart';
import '../../utils/app_colors.dart';
import 'loading_book_item.dart';

class LoadingBooksListView extends StatelessWidget {
  const LoadingBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.greyColor.withOpacity(0.8),
      highlightColor: AppColors.whiteColor,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: kMaxResults,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 4),
            child: LoadingBookItem(),
          );
        },
      ),
    );
  }
}
