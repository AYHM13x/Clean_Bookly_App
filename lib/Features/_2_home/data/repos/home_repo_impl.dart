import 'package:bookly_app/Features/_2_home/data/data_sources/home_local_data_source.dart';
import 'package:bookly_app/Features/_2_home/data/data_sources/home_remote_data_source.dart';
import 'package:dartz/dartz.dart';

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
  Future<Either<Failures, List<BookEntity>>> fetchFreeBooksCards() async {
    try {
      List<BookEntity> localBooks = homeLocalDataSource.fetchFreeBooksCards();
      if (localBooks.isNotEmpty) {
        return right(localBooks);
      }
      List<BookEntity> remoteBooks =
          await homeRemoteDataSource.fetchFreeBooksCards();
      return right(remoteBooks);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<BookEntity>>> fetchNewestFreeBooks() async {
    try {
      List<BookEntity> localBooks = homeLocalDataSource.fetchNewestFreeBooks();
      if (localBooks.isNotEmpty) {
        return right(localBooks);
      }
      List<BookEntity> remoteBooks =
          await homeRemoteDataSource.fetchNewestFreeBooks();
      return right(remoteBooks);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
