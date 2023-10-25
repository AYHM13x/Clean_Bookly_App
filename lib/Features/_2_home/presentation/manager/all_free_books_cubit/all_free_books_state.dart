part of 'all_free_books_cubit.dart';

abstract class AllFreeBooksState extends Equatable {
  const AllFreeBooksState();

  @override
  List<Object> get props => [];
}

class AllFreeBooksInitial extends AllFreeBooksState {}

class AllFreeBooksLoading extends AllFreeBooksState {}

class AllFreeBooksPaginationLoading extends AllFreeBooksState {}

class AllFreeBooksSuccess extends AllFreeBooksState {
  final List<BookEntity> books;

  const AllFreeBooksSuccess(this.books);
}

class AllFreeBooksFailure extends AllFreeBooksState {
  final String errMessage;

  const AllFreeBooksFailure(this.errMessage);
}

class AllFreeBooksPaginationFailure extends AllFreeBooksState {
  final String errMessage;

  const AllFreeBooksPaginationFailure(this.errMessage);
}
