import 'package:bookly_app/Features/_2_home/presentation/manager/all_free_books_cubit/all_free_books_cubit.dart';
import 'package:bookly_app/Features/_2_home/presentation/manager/newest_free_books_cubit/newest_free_books_cubit.dart';
import 'package:bookly_app/constents.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/assets.dart';
import '../../../../../../core/utils/dimensions_of_screen.dart';
import '../../../../../../core/widgets/custom_widgets/custom_icon_button.dart';
import '../../../../domain/entities/book_entity.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({
    super.key,
  });

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
            AssetsData.logo,
            height: 41,
            width: 100,
          ),
          const Expanded(child: SizedBox()),
          CustomIconButton(
            icon: const Icon(
              Icons.edit,
              color: AppColors.whiteColor,
            ),
            onPressed: () {
              GoRouter.of(context).push(AppRouter.editEntryViewPath);
            },
          ),
          CustomIconButton(
            icon: const Icon(
              Icons.refresh,
              color: AppColors.whiteColor,
            ),
            onPressed: () {
              Box<BookEntity> bookFreeBox =
                  Hive.box<BookEntity>(kBoxOfFreeBooks);
              Box<BookEntity> bookNewestBox =
                  Hive.box<BookEntity>(kBoxOfFreeNewestBooks);
              bookFreeBox.clear();
              bookNewestBox.clear();
              BlocProvider.of<AllFreeBooksCubit>(context).fetchFreeBooks();
              BlocProvider.of<NewestFreeBooksCubit>(context).fetchNewestBooks();
            },
          ),
          //icon in app bar
          CustomIconButton(
            icon: const Icon(
              Icons.search,
              color: AppColors.whiteColor,
            ),
            onPressed: () {
              GoRouter.of(context).push(AppRouter.searchViewPath);
            },
          )
        ],
      ),
    );
  }
}
