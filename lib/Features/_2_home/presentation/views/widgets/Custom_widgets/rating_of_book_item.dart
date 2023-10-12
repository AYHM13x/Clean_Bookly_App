import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../../core/utils/assets.dart';
import '../../../../../../core/utils/styles.dart';

class RatingOfBookItem extends StatelessWidget {
  const RatingOfBookItem({super.key});

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
        const Text(
          "4.5",
          style: Styles.textStyle16,
        ),
        const SizedBox(
          width: 6,
        ),
        Opacity(
          opacity: 0.5,
          child: Text(
            "(4533)",
            style: Styles.textStyle14.copyWith(
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
