import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/use_cases/no_param_use_case.dart';
import '../entities/book_entity.dart';
import '../repos/home_repo.dart';

class FecthNewsestFreeBooksUseCase extends UseCase<List<BookEntity>> {
  final HomeRepo homeRepo;

  FecthNewsestFreeBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failures, List<BookEntity>>> call() async {
    return await homeRepo.fetchNewestFreeBooks();
  }
}
