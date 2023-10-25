import 'package:bookly_app/Features/_2_home/presentation/manager/all_free_books_cubit/all_free_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/widgets/item_view/book_card_item.dart';
import '../../../domain/entities/book_entity.dart';

class BookCardsHomeListView extends StatefulWidget {
  const BookCardsHomeListView({
    Key? key,
    required this.books,
  }) : super(key: key);

  final List<BookEntity> books;

  @override
  State<StatefulWidget> createState() => _BookCardsHomeListViewState();
}

class _BookCardsHomeListViewState extends State<BookCardsHomeListView> {
  late final ScrollController _scrollController;

  int nextPage = 1;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() async {
    var currentPositions = _scrollController.position.pixels;
    var maxScrollLength = _scrollController.position.maxScrollExtent;
    if (currentPositions >= 0.6 * maxScrollLength) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<AllFreeBooksCubit>(context)
            .fetchFreeBooks(pageNumber: nextPage++);
        isLoading = false;
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      controller: _scrollController,
      itemCount: widget.books.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: GestureDetector(
            onTap: () {
              debugPrint(index.toString());
              GoRouter.of(context).push(AppRouter.bookDetailsViewPath,
                  extra: widget.books[index]);
            },
            child: BookCardItemView(
              imageUrl: widget.books[index].image ?? "",
            ),
          ),
        );
      },
    );
  }
}

// class BookCardsHomeListView extends StatelessWidget {
//   const BookCardsHomeListView({
//     super.key,
//     required this.books,
//   });
//   final List<BookEntity> books;
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       physics: const BouncingScrollPhysics(),
//       scrollDirection: Axis.horizontal,
//       itemCount: books.length,
//       itemBuilder: (context, index) {
//         return Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 8),
//           child: GestureDetector(
//             onTap: () {
//               debugPrint(index.toString());
//               GoRouter.of(context)
//                   .push(AppRouter.bookDetailsViewPath, extra: books[index]);
//             },
//             child: BookCardItemView(
//               imageUrl: books[index].image ?? "",
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
