import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';

import '../../../../core/use_cases/use_case.dart';
import '../entities/book_entity.dart';
import '../repos/home_repo.dart';

class FetchSimilarBooksUseCase extends UseCase<List<BookEntity>, String> {
  final HomeRepo homeRepo;

  FetchSimilarBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failures, List<BookEntity>>> call(
      [String category = ""]) async {
    return await homeRepo.fetchSimilarFreeBooks(
      category: category,
    );
  }

  // @override
  // Future<Either<Failures, List<BookEntity>>> call(
  //     {required String category}) async {
  //   return await homeRepo.fetchSimilarFreeBooks(category: category);
  // }
}
