import 'package:flutter/material.dart';

import '../../../../../core/utils/dimensions_of_screen.dart';
import '../widgets/Custom_widgets/custom_book_detail_app_bar.dart';
import '../widgets/Custom_widgets/detail_book_section.dart';
import '../widgets/Custom_widgets/similar_book_section.dart';

class BookDetailsViewBodyOldVersion extends StatelessWidget {
  const BookDetailsViewBodyOldVersion({super.key});

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
          const DetailBookSection(),
          SizedBox(
            height: DimensionsOfScreen.dimensionsOfHeight(context, 6.85),
          ),
          const DetailBookSection()
        ],
      ),
    );
  }
}

//didn't work with me correctly
class BookDetailsViewBodyNewVersion extends StatelessWidget {
  const BookDetailsViewBodyNewVersion({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //AppBar
              CustomBookDetailAppBar(),
              //Book Card
              DetailBookSection(),
              // const Expanded(
              //   child: SizedBox(),
              // ),
            ],
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
        ),
        SliverToBoxAdapter(
          child: SimilarBooksSection(),
        )
      ],
    );
  }
}

class BookDetailsViewBodySamyVersion extends StatelessWidget {
  const BookDetailsViewBodySamyVersion({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              //AppBar
              CustomBookDetailAppBar(),
              //Book Card Section
              DetailBookSection(),
              Expanded(
                child: SizedBox(),
              ),
              SimilarBooksSection(),
            ],
          ),
        ),
      ],
    );
  }
}
