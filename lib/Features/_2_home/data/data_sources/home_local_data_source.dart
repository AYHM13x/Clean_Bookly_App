import '../../domain/entities/book_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchAllFreeBooksCards();
  List<BookEntity> fetchNewestFreeBooks();
}
