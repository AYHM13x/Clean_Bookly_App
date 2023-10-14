import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/_2_home/domain/entities/book_entity.dart';
import 'package:bookly_app/Features/_2_home/domain/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'free_books_state.dart';

class FreeBooksCubit extends Cubit<FreeBooksState> {
  FreeBooksCubit() : super(FreeBooksInitial());
  //HomeRepo homeRepo;
}
