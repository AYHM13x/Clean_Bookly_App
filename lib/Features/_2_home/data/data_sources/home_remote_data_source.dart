import '../../domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchAllFreeBooksCards();
  Future<List<BookEntity>> fetchNewestFreeBooks();
  Future<List<BookEntity>> fetchSimilarFreeBooks({required String category});
}
