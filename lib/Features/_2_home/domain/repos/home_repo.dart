import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/book_entity.dart';

abstract class HomeRepo {
  Future<Either<Failures, List<BookEntity>>> fetchAllFreeBooksCards();
  Future<Either<Failures, List<BookEntity>>> fetchNewestFreeBooks();
}
