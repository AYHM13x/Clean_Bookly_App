import 'package:bookly_app/Features/_2_home/data/data_sources/home_local_data_source.dart';
import 'package:bookly_app/Features/_2_home/data/data_sources/home_remote_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/entities/book_entity.dart';
import '../../domain/repos/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeLocalDataSource homeLocalDataSource;
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepoImpl({
    required this.homeLocalDataSource,
    required this.homeRemoteDataSource,
  });

  @override
  Future<Either<Failures, List<BookEntity>>> fetchAllFreeBooksCards(
      {int pageNumber = 0}) async {
    try {
      List<BookEntity> books;
      books =
          homeLocalDataSource.fetchAllFreeBooksCards(pageNumber: pageNumber);
      debugPrint(books.isNotEmpty.toString());
      if (books.isNotEmpty) {
        return right(books);
      } else {
        books = await homeRemoteDataSource.fetchAllFreeBooksCards(
            pageNumber: pageNumber);
        return right(books);
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<BookEntity>>> fetchNewestFreeBooks(
      {int pageNumber = 0}) async {
    try {
      List<BookEntity> books;
      books = homeLocalDataSource.fetchNewestFreeBooks(pageNumber: pageNumber);
      debugPrint(books.isNotEmpty.toString());
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await homeRemoteDataSource.fetchNewestFreeBooks(
          pageNumber: pageNumber);
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<BookEntity>>> fetchSimilarFreeBooks(
      {required String category}) async {
    try {
      List<BookEntity> books;
      books = await homeRemoteDataSource.fetchSimilarFreeBooks(
        category: category,
      );
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
