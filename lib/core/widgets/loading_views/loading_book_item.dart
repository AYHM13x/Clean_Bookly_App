import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constents.dart';
import '../../utils/app_colors.dart';
import '../../utils/assets.dart';
import '../../utils/dimensions_of_screen.dart';

class LoadingBookItem extends StatelessWidget {
  const LoadingBookItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 105,
          child: AspectRatio(
            aspectRatio: 2 / 3,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kBorderRadiusValue),
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: DimensionsOfScreen.dimensionsOfWidth(context, 66),
                height: 25,
                color: AppColors.primaryColor,
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                width: DimensionsOfScreen.dimensionsOfWidth(context, 40),
                height: 15,
                color: AppColors.primaryColor,
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Container(
                    width: DimensionsOfScreen.dimensionsOfWidth(context, 20),
                    height: 20,
                    color: AppColors.primaryColor,
                  ),
                  const Spacer(),
                  SvgPicture.asset(
                    AssetsData.star,
                    height: 13,
                    width: 13,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Container(
                    width: DimensionsOfScreen.dimensionsOfWidth(context, 10),
                    height: 20,
                    color: AppColors.primaryColor,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Container(
                    width: DimensionsOfScreen.dimensionsOfWidth(context, 10),
                    height: 20,
                    color: AppColors.primaryColor,
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
