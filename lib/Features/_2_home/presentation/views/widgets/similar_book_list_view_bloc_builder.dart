import 'package:bookly_app/Features/_2_home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/core/widgets/loading_views/loading_card_list_view.dart';
import 'package:bookly_app/core/widgets/failures/failure_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/dimensions_of_screen.dart';
import 'similar_book_list_view.dart';

class SimilarBookListViewBlocBuilder extends StatelessWidget {
  const SimilarBookListViewBlocBuilder({
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
            return SimilarBookListView(
              books: state.books,
            );
          } else if (state is SimilarBooksFailure) {
            return FailureView(errMessage: state.errMessage);
          } else {
            return const LoadingCardListView();
          }
        },
      ),
    );
  }
}
