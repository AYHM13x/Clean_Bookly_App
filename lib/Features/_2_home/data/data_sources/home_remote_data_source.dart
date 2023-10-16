import '../../domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchAllFreeBooksCards({required String entry});
  Future<List<BookEntity>> fetchNewestFreeBooks({required String entry});
  Future<List<BookEntity>> fetchSimilarFreeBooks({required String category});
}
