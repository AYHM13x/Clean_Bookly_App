import 'package:bookly_app/Features/_2_home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/core/widgets/custom_widgets/custom_indicator.dart';
import 'package:bookly_app/core/widgets/failures/failure_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/dimensions_of_screen.dart';
import 'Custom_widgets/book_card_item.dart';

class SimilarBookListView extends StatelessWidget {
  const SimilarBookListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    debugPrint(DimensionsOfScreen.dimensionsOfHeight(context, 16).toString());
    return SizedBox(
      height: DimensionsOfScreen.dimensionsOfHeight(context, 16),
      child: BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
        builder: (context, state) {
          if (state is SimilarBooksSuccess) {
            debugPrint(state.books.length.toString());
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: GestureDetector(
                    onTap: () {
                      debugPrint(index.toString());
                      // Get.to(() => const BookDetailsView(),
                      //     transition: Transition.fadeIn,
                      //     duration: kNavigationToNextView);
                      GoRouter.of(context).push(AppRouter.bookDetailsViewPath,
                          extra: state.books[index]);
                    },
                    child: BookCardItemView(
                      imageUrl: state.books[index].image,
                    ),
                  ),
                );
              },
            );
          } else if (state is SimilarBooksFailure) {
            return FailureView(errMessage: state.errMessage);
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
