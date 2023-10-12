import 'package:bookly_app/Features/_2_home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/book_entity.dart';

class FetchFreeBooksCardsUseCase {
  final HomeRepo homeRepo;

  FetchFreeBooksCardsUseCase(this.homeRepo);

  Future<Either<Failures, List<BookEntity>>> fetchFreeBooksCards() {
    return homeRepo.fetchFreeBooksCards();
  }
}
