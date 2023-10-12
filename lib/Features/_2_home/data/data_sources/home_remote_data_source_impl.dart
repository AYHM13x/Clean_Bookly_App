import '../../domain/entities/book_entity.dart';
import 'home_remote_data_source.dart';

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  @override
  Future<List<BookEntity>> fetchFreeBooksCards() {
    // TODO: implement fetchFreeBooksCards
    throw UnimplementedError();
  }

  @override
  Future<List<BookEntity>> fetchNewestFreeBooks() {
    // TODO: implement fetchNewestFreeBooks
    throw UnimplementedError();
  }
}
