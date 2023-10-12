import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/book_entity.dart';

abstract class HomeRepo {
  Future<Either<Failures, List<BookEntity>>> fetchFreeBooksCards();
  Future<Either<Failures, List<BookEntity>>> fetchNewestFreeBooks();
}
