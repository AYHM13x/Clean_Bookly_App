import 'package:bookly_app/core/widgets/loading_views/loading_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/dimensions_of_screen.dart';
import '../../../../../core/widgets/failures/failure_view.dart';
import '../../manager/newest_free_books_cubit/newest_free_books_cubit.dart';
import 'newest_free_books_list_view.dart';

class NewestFreeBooksListViewBlocBuilder extends StatelessWidget {
  const NewestFreeBooksListViewBlocBuilder({
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
            return NewestFreeBooksListView(
              books: state.books,
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
