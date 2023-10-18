import 'package:bookly_app/Features/_2_home/presentation/manager/all_free_books_cubit/all_free_books_cubit.dart';
import 'package:bookly_app/Features/_2_home/presentation/manager/newest_free_books_cubit/newest_free_books_cubit.dart';
import 'package:bookly_app/constents.dart';
import 'package:bookly_app/core/utils/app_colors.dart';
import 'package:bookly_app/core/utils/dimensions_of_screen.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/core/widgets/custom_widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';

import '../../../../../core/widgets/custom_widgets/custom_text_form_field.dart';
import '../../../domain/entities/book_entity.dart';

class EditEntryViewBody extends StatefulWidget {
  const EditEntryViewBody({super.key});

  @override
  State<EditEntryViewBody> createState() => _EditEntryViewBodyState();
}

class _EditEntryViewBodyState extends State<EditEntryViewBody> {
  String freeBooksEntry = kFreeBooks;
  String newestFreeBooksEntry = kNewestFreeBooks;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: DimensionsOfScreen.dimensionsOfHeight(context, 10),
        ),
        CustomTextField(
          hintText: "free Books",
          initValue: freeBooksEntry,
          onChange: (data) {
            freeBooksEntry = data;
          },
        ),
        SizedBox(
          height: DimensionsOfScreen.dimensionsOfHeight(context, 5),
        ),
        CustomTextField(
          hintText: "newest free Books",
          initValue: newestFreeBooksEntry,
          onChange: (data) {
            newestFreeBooksEntry = data;
          },
        ),
        SizedBox(
          height: DimensionsOfScreen.dimensionsOfHeight(context, 5),
        ),
        SizedBox(
          width: DimensionsOfScreen.dimensionsOfWidth(context, 80),
          child: CustomButton(
            text: "Enter",
            style: Styles.textStyle18.copyWith(
              color: AppColors.whiteColor,
            ),
            backgroundColor: AppColors.orangeColor,
            onPressed: () {
              Box<BookEntity> bookFreeBox =
                  Hive.box<BookEntity>(kBoxOfFreeBooks);
              Box<BookEntity> bookNewestBox =
                  Hive.box<BookEntity>(kBoxOfFreeNewestBooks);
              bookFreeBox.clear();
              bookNewestBox.clear();
              BlocProvider.of<AllFreeBooksCubit>(context).fetchFreeBooks();
              BlocProvider.of<NewestFreeBooksCubit>(context)
                  .fetchNewestBooks(entry: newestFreeBooksEntry);
              GoRouter.of(context).pop();
            },
          ),
        )
      ],
    );
  }
}
