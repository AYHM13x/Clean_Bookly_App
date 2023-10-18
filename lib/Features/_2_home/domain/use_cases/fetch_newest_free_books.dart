import 'package:bookly_app/core/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';

import '../entities/book_entity.dart';
import '../repos/home_repo.dart';

class FecthNewsestFreeBooksUseCase extends UseCase<List<BookEntity>, NoParam> {
  final HomeRepo homeRepo;

  FecthNewsestFreeBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failures, List<BookEntity>>> call(
      [ NoParam? param]) async {
    return await homeRepo.fetchNewestFreeBooks();
  }

  // @override
  // Future<Either<Failures, List<BookEntity>>> call() async {
  //   return await homeRepo.fetchNewestFreeBooks();
  // }

  // @override
  // Future<Either<Failures, List<BookEntity>>> call() async {
  //   return await homeRepo.fetchNewestFreeBooks();
  // }
}
