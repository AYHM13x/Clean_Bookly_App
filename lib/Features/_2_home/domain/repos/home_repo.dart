import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/book_entity.dart';

abstract class HomeRepo {
  Future<Either<Failures, List<BookEntity>>> fetchAllFreeBooksCards(
      {required String entry});
  Future<Either<Failures, List<BookEntity>>> fetchNewestFreeBooks(
      {required String entry});
  Future<Either<Failures, List<BookEntity>>> fetchSimilarFreeBooks(
      {required String category});
}
