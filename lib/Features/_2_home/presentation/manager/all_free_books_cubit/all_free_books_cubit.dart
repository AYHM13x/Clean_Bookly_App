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
  Future<void> fetchFreeBooks({required String entry}) async {
    emit(AllFreeBooksLoading());

    Either<Failures, List<BookEntity>> result =
        await fetchFreeBooksCardsUseCase.requiredParamCall(param: entry);

    result.fold((failure) {
      emit(AllFreeBooksFailure(failure.errMessage));
    }, (freeBooks) {
      emit(AllFreeBooksSuccess(freeBooks));
    });
  }
}
