import 'package:bookly_app/Features/_2_home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';

import '../../../../core/use_cases/use_case.dart';
import '../entities/book_entity.dart';

class FetchFreeBooksCardsUseCase extends UseCase<List<BookEntity>, String> {
  final HomeRepo homeRepo;

  FetchFreeBooksCardsUseCase(this.homeRepo);

  @override
  Future<Either<Failures, List<BookEntity>>> requiredParamCall(
      {required String param}) async {
    return await homeRepo.fetchAllFreeBooksCards(entry: param);
  }

  // @override
  // Future<Either<Failures, List<BookEntity>>> call() async {
  //   return await homeRepo.fetchAllFreeBooksCards();
  // }
}
