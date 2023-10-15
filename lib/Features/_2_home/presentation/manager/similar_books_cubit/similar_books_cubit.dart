import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/_2_home/domain/use_cases/fetch_similar_books.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/errors/failures.dart';
import '../../../domain/entities/book_entity.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.fetchSimilarBooksUseCase)
      : super(SimilarBooksInitial());

  final FetchSimilarBooksUseCase fetchSimilarBooksUseCase;

  Future<void> fetchSimilarBooks({required String category}) async {
    emit(SimilarBooksLoading());

    Either<Failures, List<BookEntity>> result =
        await fetchSimilarBooksUseCase.requiredParamCall(category: category);

    result.fold(
      (failure) {
        emit(
          SimilarBooksFailure(failure.errMessage),
        );
      },
      (similarFreeBooks) {
        emit(
          SimilarBooksSuccess(similarFreeBooks),
        );
      },
    );
  }
}
