import 'package:flutter/material.dart';

import '../../../../../../constents.dart';
import '../../../../../../core/utils/assets.dart';

class BookCardItemView extends StatelessWidget {
  const BookCardItemView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2 / 3,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kBorderRadiusValue),
          image: const DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(AssetsData.testImage),
          ),
        ),
      ),
    );
  }
}
