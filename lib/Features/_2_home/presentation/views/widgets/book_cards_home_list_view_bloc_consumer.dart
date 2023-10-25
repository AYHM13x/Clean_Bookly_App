import 'package:bookly_app/Features/_2_home/domain/entities/book_entity.dart';
import 'package:bookly_app/core/widgets/custom_widgets/custom_show_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/dimensions_of_screen.dart';
import '../../../../../core/widgets/failures/failure_view.dart';
import '../../manager/all_free_books_cubit/all_free_books_cubit.dart';
import 'book_cards_home_view.dart';
import '../../../../../core/widgets/loading_views/loading_card_list_view.dart';

class BookCardsHomeListViewBlocConsumer extends StatefulWidget {
  const BookCardsHomeListViewBlocConsumer({
    super.key,
  });

  @override
  State<BookCardsHomeListViewBlocConsumer> createState() =>
      _BookCardsHomeListViewBlocConsumerState();
}

class _BookCardsHomeListViewBlocConsumerState
    extends State<BookCardsHomeListViewBlocConsumer> {
  List<BookEntity> currentBooks = [];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: DimensionsOfScreen.dimensionsOfHeight(context, 33.33333333),
      child: BlocConsumer<AllFreeBooksCubit, AllFreeBooksState>(
        listener: (context, state) {
          if (state is AllFreeBooksSuccess) {
            currentBooks.addAll(state.books);
          }
          if (state is AllFreeBooksPaginationFailure) {
            customShowSnackBar(
              context,
              message: state.errMessage,
              isError: true,
            );
          }
        },
        builder: (context, state) {
          if (state is AllFreeBooksSuccess ||
              state is AllFreeBooksPaginationLoading ||
              state is AllFreeBooksPaginationFailure) {
            return BookCardsHomeListView(
              books: currentBooks,
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
