import 'package:hive/hive.dart';

import '../../../Features/_2_home/domain/entities/book_entity.dart';

void saveBooksListData(List<BookEntity> books, String boxName) {
  Box<BookEntity> bookBox = Hive.box<BookEntity>(boxName);
  bookBox.addAll(books);
}
