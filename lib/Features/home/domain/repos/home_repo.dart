import '../entities/book_entity.dart';

abstract class HomeRepo {
  Future<BookEntity> fetchFreeBooksCards();
  Future<BookEntity> fetchNewestFreeBooks();
}
