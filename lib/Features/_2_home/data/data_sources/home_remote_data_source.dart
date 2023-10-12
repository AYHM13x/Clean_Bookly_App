import '../../domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFreeBooksCards();
  Future<List<BookEntity>> fetchNewestFreeBooks();
}
