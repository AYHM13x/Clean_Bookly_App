import 'package:bookly_app/Features/_2_home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/book_entity.dart';

class FecthNewsestFreeBooksUseCase {
  final HomeRepo homeRepo;

  FecthNewsestFreeBooksUseCase(this.homeRepo);
  Future<Either<Failures, List<BookEntity>>> fetchNewestFreeBooks() {
    return homeRepo.fetchNewestFreeBooks();
  }
}
