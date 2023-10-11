import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/widgets/custom_widgets/custom_icon_button.dart';

class CustomBookDetailAppBar extends StatelessWidget {
  const CustomBookDetailAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //double height4 = DimensionsOfScreen.dimensionsOfHeight(context, 4);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomIconButton(
          icon: const Icon(
            Icons.close,
            color: AppColors.whiteColor,
          ),
          onPressed: () {
            //Get.back();
            GoRouter.of(context).pop();
          },
        ),
        CustomIconButton(
          icon: const Icon(Icons.shopping_cart_outlined),
          onPressed: () {},
        ),
      ],
    );
  }
}
