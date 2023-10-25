import 'package:bookly_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../../utils/styles.dart';

void customShowSnackBar(BuildContext context,
    {required String message, bool isError = false}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Center(
        child: Text(
          message,
          style: Styles.textStyle16.copyWith(
            color: AppColors.whiteColor,
          ),
        ),
      ),
      backgroundColor: isError ? AppColors.redColor : AppColors.primaryColor,
      duration: const Duration(seconds: 7),
    ),
  );
}
