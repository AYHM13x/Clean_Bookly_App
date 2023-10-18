import 'package:bookly_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../constents.dart';
import '../../../../../../core/utils/assets.dart';

class BookCardItemView extends StatelessWidget {
  const BookCardItemView({
    super.key,
    required this.imageUrl,
  });
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(kBorderRadiusValue),
      child: AspectRatio(
        aspectRatio: 2 / 3,
        child: Image.network(
          imageUrl,
          fit: BoxFit.fill,
          filterQuality: FilterQuality.high,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) {
              return child;
            }
            return Center(
              child: Shimmer.fromColors(
                baseColor: AppColors.greyColor.withOpacity(0.8),
                highlightColor: AppColors.primaryColor,
                direction: ShimmerDirection.ltr,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kBorderRadiusValue),
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
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






// CachedNetworkImage(
//           imageUrl: imageUrl,
//           placeholder: (context, url) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           },
//           errorWidget: (context, url, error) {
//             return Image.asset(
//               AssetsData.errorImage,
//               fit: BoxFit.fill,
//             );
//           },
//         )