import '../../../../constents.dart';
import '../../../../core/utils/api_service.dart';
import '../../../../core/utils/functions/save_data.dart';
import '../../domain/entities/book_entity.dart';
import '../models/book_model/book_model.dart';
import 'home_remote_data_source.dart';

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;
  final String _allFreeBooks =
      "volumes?Filtering=free-ebooks&maxResults=40&q=intitle:$kFreeBooks";
  final String _newestFreeBooks =
      "volumes?Filtering=free-ebooks&Sorting=newest&maxResults=40&q=intitle:$kNewestFreeBooks";

  HomeRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<BookEntity>> fetchAllFreeBooksCards() async {
    Map<String, dynamic> data = await apiService.get(endPoint: _allFreeBooks);

    List<BookEntity> books = getBooksList(data);

    saveBooksListData(books, kBoxOfFreeBooks);

    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestFreeBooks() async {
    Map<String, dynamic> data =
        await apiService.get(endPoint: _newestFreeBooks);

    List<BookEntity> books = getBooksList(data);

    saveBooksListData(books, kBoxOfFreeNewestBooks);

    return books;
  }

  @override
  Future<List<BookEntity>> fetchSimilarFreeBooks(
      {required String category}) async {
    String similarBooks =
        "volumes?Filtering=free-ebooks&Sorting=relevance&maxResults=40&q=subject:$category";
    Map<String, dynamic> data = await apiService.get(endPoint: similarBooks);

    List<BookEntity> books = getBooksList(data);

    //saveBooksListData(books, kBoxOfFreeNewestBooks);

    return books;
  }

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var item in data["items"] ?? []) {
      books.add(BookModel.fromJson(item));
    }
    return books;
  }
}
