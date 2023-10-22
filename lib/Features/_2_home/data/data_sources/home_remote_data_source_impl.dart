import 'package:flutter/material.dart';

import '../../../../constents.dart';
import '../../../../core/utils/api_service.dart';
import '../../../../core/utils/functions/save_data.dart';
import '../../domain/entities/book_entity.dart';
import '../models/book_model/book_model.dart';
import 'home_remote_data_source.dart';

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<BookEntity>> fetchAllFreeBooksCards({int pageNumber = 0}) async {
    // volumes?startIndex=10&maxResults=40&q=subject:
    String freeBooks =
        "volumes?Filtering=free-ebooks&startIndex=${pageNumber * kMaxResults}&maxResults=$kMaxResults&q=subject:$kFreeBooks";
    Map<String, dynamic> data = await apiService.get(endPoint: freeBooks);

    List<BookEntity> books = getBooksList(data);

    saveBooksListData(books, kBoxOfFreeBooks);

    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestFreeBooks({int pageNumber = 0}) async {
    String newestFreeBooks =
        "volumes?Filtering=free-ebooks&Sorting=newest&startIndex=${pageNumber * kMaxResults}&maxResults=$kMaxResults&q=subject:$kNewestFreeBooks";

    Map<String, dynamic> data = await apiService.get(endPoint: newestFreeBooks);

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

    debugPrint(category);

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
