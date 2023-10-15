import 'package:bookly_app/Features/_2_home/presentation/manager/all_free_books_cubit/all_free_books_cubit.dart';
import 'package:bookly_app/core/utils/dimensions_of_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/widgets/custom_widgets/custom_indicator.dart';
import '../../../../../core/widgets/failures/failure_view.dart';
import 'Custom_widgets/book_card_item.dart';

class BookCardsHomeListView extends StatelessWidget {
  const BookCardsHomeListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: DimensionsOfScreen.dimensionsOfHeight(context, 33.33333333),
      child: BlocBuilder<AllFreeBooksCubit, AllFreeBooksState>(
        builder: (context, state) {
          if (state is AllFreeBooksSuccess) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: GestureDetector(
                    onTap: () {
                      debugPrint(index.toString());
                      GoRouter.of(context).push(AppRouter.bookDetailsViewPath);
                    },
                    child: BookCardItemView(
                      imageUrl: state.books[index].image ?? "",
                    ),
                  ),
                );
              },
            );
          } else if (state is AllFreeBooksFailure) {
            return FailureView(
              errMessage: state.errMessage,
            );
          } else {
            return const CustomIndicator(
              indeicatorType: 1,
            );
          }
        },
      ),
    );
  }
}
