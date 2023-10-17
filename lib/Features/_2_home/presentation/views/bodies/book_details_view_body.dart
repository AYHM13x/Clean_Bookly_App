import 'package:bookly_app/Features/_2_home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/dimensions_of_screen.dart';
import '../widgets/Custom_widgets/custom_book_detail_app_bar.dart';
import '../widgets/Custom_widgets/detail_book_section.dart';
import '../widgets/Custom_widgets/similar_book_section.dart';

class BookDetailsViewBodyOldVersion extends StatelessWidget {
  const BookDetailsViewBodyOldVersion({super.key, required this.book});
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(
        bottom: 40,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //AppBar
          const CustomBookDetailAppBar(),
          //Book Card
          // const DetailBookSection(),
          SizedBox(
            height: DimensionsOfScreen.dimensionsOfHeight(context, 6.85),
          ),
          //const DetailBookSection()
        ],
      ),
    );
  }
}

//didn't work with me correctly
class BookDetailsViewBodyNewVersion extends StatelessWidget {
  const BookDetailsViewBodyNewVersion({super.key, required this.book});
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //AppBar
        const CustomBookDetailAppBar(),
        SizedBox(
          height: DimensionsOfScreen.dimensionsOfHeight(context, 88),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //Book Card
                    DetailBookSection(
                      book: book,
                    ),
                  ],
                ),
              ),
              const SliverFillRemaining(
                hasScrollBody: false,
              ),
              SliverToBoxAdapter(
                child: SimilarBooksSection(
                  category: book.category!,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class BookDetailsViewBodySamyVersion extends StatelessWidget {
  const BookDetailsViewBodySamyVersion({super.key, required this.book});
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              //AppBar
              const CustomBookDetailAppBar(),
              //Book Card Section
              //DetailBookSection(),
              const Expanded(
                child: SizedBox(),
              ),
              SimilarBooksSection(
                category: book.category!,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
