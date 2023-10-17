import 'package:bookly_app/Features/_2_home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';

import '../../../../../../constents.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/functions/custom_launch_url.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/widgets/custom_widgets/custom_button.dart';

class PayAndFreePreviewButtons extends StatelessWidget {
  const PayAndFreePreviewButtons({
    super.key,
    required this.book,
  });
  final double height = 48;
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: CustomButton(
            text: book.price == 0 ? "Free" : "19.99$kEuroSympol",
            style: Styles.textStyle18.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.primaryColor,
            ),
            backgroundColor: AppColors.whiteColor,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(kBorderRadiusValue),
                bottomLeft: Radius.circular(kBorderRadiusValue)),
            onPressed: () {
              debugPrint("pay");
            },
          ),
        ),
        Expanded(
          child: CustomButton(
            text: textOfPreview(book),
            style: Styles.textStyle16.copyWith(
              fontFamily: kRoboto,
              fontWeight: FontWeight.normal,
              color: AppColors.whiteColor,
            ),
            backgroundColor: AppColors.orangeColor,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(kBorderRadiusValue),
              bottomRight: Radius.circular(kBorderRadiusValue),
            ),
            onPressed: () async {
              await customLaunchUrl(context, book);
            },
          ),
        )
      ],
    );
  }

  String textOfPreview(BookEntity book) {
    if (book.previewLink == null) {
      return "Unavailable";
    } else {
      return "Free Preview";
    }
  }
}
