import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../constents.dart';
import '../../utils/app_colors.dart';
import '../../utils/dimensions_of_screen.dart';

class LoadingCardListView extends StatelessWidget {
  const LoadingCardListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.greyColor.withOpacity(0.8),
      highlightColor: AppColors.whiteColor,
      direction: ShimmerDirection.ltr,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: AspectRatio(
              aspectRatio: 2 / 3,
              child: Container(
                height: DimensionsOfScreen.dimensionsOfHeight(context, 33.3333),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kBorderRadiusValue),
                  color: AppColors.primaryColor,
                ),
                //color: AppColors.redColor,
              ),
            ),
          );
        },
      ),
    );
  }
}
