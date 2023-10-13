import 'package:bookly_app/Features/_2_home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

import '../../../../constents.dart';
import 'home_local_data_source.dart';

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFreeBooksCards() {
    Box<BookEntity> noteBox = Hive.box<BookEntity>(kFreeBooksBox);
    List<BookEntity> notesList = noteBox.values.toList();
    return notesList;
  }

  @override
  List<BookEntity> fetchNewestFreeBooks() {
    Box<BookEntity> noteBox = Hive.box<BookEntity>(kFreeNewestBooksBox);
    List<BookEntity> notesList = noteBox.values.toList();
    return notesList;
  }
}
