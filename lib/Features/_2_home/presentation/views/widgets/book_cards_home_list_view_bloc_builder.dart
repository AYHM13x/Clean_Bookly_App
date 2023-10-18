import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/dimensions_of_screen.dart';
import '../../../../../core/widgets/failures/failure_view.dart';
import '../../manager/all_free_books_cubit/all_free_books_cubit.dart';
import 'book_cards_home_view.dart';
import '../../../../../core/widgets/loading_views/loading_card_list_view.dart';

class BookCardsHomeListViewBlocBuilder extends StatelessWidget {
  const BookCardsHomeListViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: DimensionsOfScreen.dimensionsOfHeight(context, 33.33333333),
      child: BlocBuilder<AllFreeBooksCubit, AllFreeBooksState>(
        builder: (context, state) {
          if (state is AllFreeBooksSuccess) {
            return BookCardsHomeListView(
              books: state.books,
            );
          } else if (state is AllFreeBooksFailure) {
            return FailureView(
              errMessage: state.errMessage,
            );
          } else {
            return const LoadingCardListView();
          }
        },
      ),
    );
  }
}
