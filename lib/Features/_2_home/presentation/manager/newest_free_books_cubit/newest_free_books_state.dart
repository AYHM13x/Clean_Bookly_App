part of 'newest_free_books_cubit.dart';

abstract class NewestFreeBooksState extends Equatable {
  const NewestFreeBooksState();

  @override
  List<Object> get props => [];
}

class NewestFreeBooksInitial extends NewestFreeBooksState {}

class NewestFreeBooksLoading extends NewestFreeBooksState {}

class NewestFreeBooksPaginationLoading extends NewestFreeBooksState {}

class NewestFreeBooksSuccess extends NewestFreeBooksState {
  final List<BookEntity> books;

  const NewestFreeBooksSuccess(this.books);
}

class NewestFreeBooksFailure extends NewestFreeBooksState {
  final String errMessage;

  const NewestFreeBooksFailure(this.errMessage);
}
