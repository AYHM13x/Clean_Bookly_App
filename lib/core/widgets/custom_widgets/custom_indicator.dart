import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class CustomIndicator extends StatelessWidget {
  const CustomIndicator({super.key, this.indeicatorType = 2});
  final int indeicatorType;
  @override
  Widget build(BuildContext context) {
    if (indeicatorType == 1) {
      return const CustomLinearProgressIndicator();
    } else {
      return const CustomCircularIndicator();
    }
  }
}

class CustomCircularIndicator extends StatelessWidget {
  const CustomCircularIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColors.orangeColor,
      ),
    );
  }
}

class CustomLinearProgressIndicator extends StatelessWidget {
  const CustomLinearProgressIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: LinearProgressIndicator(
          color: AppColors.orangeColor,
        ),
      ),
    );
  }
}
