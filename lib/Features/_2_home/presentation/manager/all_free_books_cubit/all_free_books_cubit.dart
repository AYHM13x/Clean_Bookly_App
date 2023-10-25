import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/errors/failures.dart';
import '../../../domain/entities/book_entity.dart';
import '../../../domain/use_cases/fetch_free_books_cards.dart';

part 'all_free_books_state.dart';

class AllFreeBooksCubit extends Cubit<AllFreeBooksState> {
  AllFreeBooksCubit(this.fetchFreeBooksCardsUseCase)
      : super(AllFreeBooksInitial());

  final FetchFreeBooksCardsUseCase fetchFreeBooksCardsUseCase;
  Future<void> fetchFreeBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(AllFreeBooksLoading());
    } else {
      emit(AllFreeBooksPaginationLoading());
    }

    Either<Failures, List<BookEntity>> result =
        await fetchFreeBooksCardsUseCase.call(pageNumber);

    result.fold((failure) {
      if (pageNumber == 0) {
        emit(AllFreeBooksFailure(failure.errMessage));
      } else {
        emit(AllFreeBooksPaginationFailure(failure.errMessage));
      }
    }, (freeBooks) {
      emit(AllFreeBooksSuccess(freeBooks));
    });
  }
}
