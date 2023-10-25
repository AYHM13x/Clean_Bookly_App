import 'package:bookly_app/Features/_2_home/domain/entities/book_entity.dart';
import 'package:bookly_app/core/widgets/custom_widgets/custom_show_snackbar.dart';
import 'package:bookly_app/core/widgets/loading_views/loading_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/dimensions_of_screen.dart';
import '../../../../../core/widgets/failures/failure_view.dart';
import '../../manager/newest_free_books_cubit/newest_free_books_cubit.dart';
import 'newest_free_books_list_view.dart';

class NewestFreeBooksListViewBlocConsumer extends StatefulWidget {
  const NewestFreeBooksListViewBlocConsumer({
    super.key,
  });

  @override
  State<NewestFreeBooksListViewBlocConsumer> createState() =>
      _NewestFreeBooksListViewBlocConsumerState();
}

class _NewestFreeBooksListViewBlocConsumerState
    extends State<NewestFreeBooksListViewBlocConsumer> {
  List<BookEntity> currentBooks = [];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: DimensionsOfScreen.dimensionsOfWidth(context, 2),
      ),
      child: BlocConsumer<NewestFreeBooksCubit, NewestFreeBooksState>(
        listener: (context, state) {
          if (state is NewestFreeBooksSuccess) {
            currentBooks.addAll(state.books);
          }
          if (state is NewestFreeBooksPaginationFailure) {
            customShowSnackBar(
              context,
              message: state.errMessage,
              isError: true,
            );
          }
        },
        builder: (context, state) {
          if (state is NewestFreeBooksSuccess ||
              state is NewestFreeBooksPaginationLoading ||
              state is NewestFreeBooksPaginationFailure) {
            return NewestFreeBooksListView(
              books: currentBooks,
            );
          } else if (state is NewestFreeBooksFailure) {
            return FailureView(errMessage: state.errMessage);
          } else {
            return const LoadingBooksListView();
          }
        },
      ),
    );
  }
}
