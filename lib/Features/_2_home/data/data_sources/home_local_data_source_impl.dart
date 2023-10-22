import 'package:bookly_app/Features/_2_home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

import '../../../../constents.dart';
import 'home_local_data_source.dart';

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchAllFreeBooksCards({int pageNumber = 0}) {
    int startIndex = pageNumber * kMaxResults;
    int endIndex = (pageNumber + 1) * kMaxResults;

    Box<BookEntity> booksBox = Hive.box<BookEntity>(kBoxOfFreeBooks);
    int length = booksBox.values.length;
    if (startIndex >= length || endIndex > length) {
      return [];
    }
    List<BookEntity> booksList =
        booksBox.values.toList().sublist(startIndex, endIndex);
    return booksList;
  }

  @override
  List<BookEntity> fetchNewestFreeBooks({int pageNumber = 0}) {
    int startIndex = pageNumber * kMaxResults;
    int endIndex = (pageNumber + 1) * kMaxResults;

    Box<BookEntity> booksBox = Hive.box<BookEntity>(kBoxOfFreeNewestBooks);
    int length = booksBox.values.length;
    if (startIndex >= length || endIndex > length) {
      return [];
    }
    List<BookEntity> notesList =
        booksBox.values.toList().sublist(startIndex, endIndex);
    return notesList;
  }
}
