import '../../domain/entities/book_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFreeBooksCards();
  List<BookEntity> fetchNewestFreeBooks();
}
