import 'package:flutter/material.dart';

import '../../../../../../constents.dart';
import '../../../../../../core/utils/assets.dart';

class BookCardItemView extends StatelessWidget {
  const BookCardItemView({
    super.key,
    this.imageUrl,
  });
  final String? imageUrl;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(kBorderRadiusValue),
      child: AspectRatio(
        aspectRatio: 2 / 3,
        child: Image.network(
          imageUrl ?? "",
          fit: BoxFit.fill,
          filterQuality: FilterQuality.high,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) {
              return child;
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          errorBuilder: (context, error, stackTrace) {
            return Image.asset(
              AssetsData.errorImage,
              fit: BoxFit.fill,
            );
          },
        ),
      ),
    );
  }
}
