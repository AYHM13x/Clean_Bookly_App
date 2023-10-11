import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/dimensions_of_screen.dart';
import '../../../../../../core/widgets/custom_widgets/custom_icon_button.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({
    super.key,
    required this.image,
    this.onPressedAppBar,
  });

  final String image;
  final Function()? onPressedAppBar;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: DimensionsOfScreen.dimensionsOfHeight(context, 2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //title of app bar
          Image.asset(
            image,
            height: 41,
            width: 100,
          ),
          //icon in app bar
          CustomIconButton(
            icon: const Icon(
              Icons.search,
              color: AppColors.whiteColor,
            ),
            onPressed: onPressedAppBar,
          )
        ],
      ),
    );
  }
}
