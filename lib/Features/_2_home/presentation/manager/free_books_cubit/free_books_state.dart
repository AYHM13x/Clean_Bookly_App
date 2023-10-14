part of 'free_books_cubit.dart';

abstract class FreeBooksState extends Equatable {
  const FreeBooksState();

  @override
  List<Object> get props => [];
}

class FreeBooksInitial extends FreeBooksState {}

class FreeBooksLoading extends FreeBooksState {}

class FreeBooksSuccess extends FreeBooksState {
  final List<BookEntity> books;

  const FreeBooksSuccess(this.books);
}

class FreeBooksFailure extends FreeBooksState {
  final String errMessage;

  const FreeBooksFailure(this.errMessage);
}
