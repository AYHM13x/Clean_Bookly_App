import '../../domain/entities/book_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchAllFreeBooksCards({int pageNumber = 0});
  List<BookEntity> fetchNewestFreeBooks({int pageNumber = 0});
}
