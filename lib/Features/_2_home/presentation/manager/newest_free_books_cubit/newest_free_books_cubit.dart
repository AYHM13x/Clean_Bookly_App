import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/errors/failures.dart';
import '../../../domain/entities/book_entity.dart';
import '../../../domain/use_cases/fetch_newest_free_books.dart';

part 'newest_free_books_state.dart';

class NewestFreeBooksCubit extends Cubit<NewestFreeBooksState> {
  NewestFreeBooksCubit(this.fecthNewsestFreeBooksUseCase)
      : super(NewestFreeBooksInitial());

  final FecthNewsestFreeBooksUseCase fecthNewsestFreeBooksUseCase;

  Future<void> fetchNewestBooks({int pageNumber = 0}) async {
    emit(NewestFreeBooksLoading());

    Either<Failures, List<BookEntity>> result =
        await fecthNewsestFreeBooksUseCase.call(pageNumber);

    result.fold(
      (failure) {
        emit(
          NewestFreeBooksFailure(failure.errMessage),
        );
      },
      (newestFreeBooks) {
        emit(
          NewestFreeBooksSuccess(newestFreeBooks),
        );
      },
    );
  }
}
