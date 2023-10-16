import 'package:bookly_app/Features/_2_home/presentation/manager/newest_free_books_cubit/newest_free_books_cubit.dart';
import 'package:bookly_app/core/widgets/failures/failure_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/dimensions_of_screen.dart';
import '../../../../../core/widgets/book_item_view.dart';
import '../../../../../core/widgets/custom_widgets/custom_indicator.dart';

class NewestFreeBooksListView extends StatelessWidget {
  const NewestFreeBooksListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: DimensionsOfScreen.dimensionsOfWidth(context, 2),
      ),
      child: BlocBuilder<NewestFreeBooksCubit, NewestFreeBooksState>(
        builder: (context, state) {
          if (state is NewestFreeBooksSuccess) {
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: GestureDetector(
                    onTap: () {
                      debugPrint(index.toString());
                      // Get.to(() => const BookDetailsView(),
                      //     transition: Transition.fadeIn,
                      //     duration: kNavigationToNextView);
                      GoRouter.of(context).push(AppRouter.bookDetailsViewPath,
                          extra: state.books[index]);
                    },
                    child: BookItemView(
                      book: state.books[index],
                    ),
                  ),
                );
              },
            );
          } else if (state is NewestFreeBooksFailure) {
            return FailureView(errMessage: state.errMessage);
          } else {
            return SizedBox(
              height: DimensionsOfScreen.dimensionsOfHeight(context, 45),
              child: const Center(
                child: CustomIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}
