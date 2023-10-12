import 'package:bookly_app/Features/_2_home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/use_cases/no_param_use_case.dart';
import '../entities/book_entity.dart';

class FetchFreeBooksCardsUseCase extends UseCase<List<BookEntity>> {
  final HomeRepo homeRepo;

  FetchFreeBooksCardsUseCase(this.homeRepo);

  @override
  Future<Either<Failures, List<BookEntity>>> call() async {
    return await homeRepo.fetchFreeBooksCards();
  }
}
