import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/dimensions_of_screen.dart';
import '../../../../../core/utils/styles.dart';
import '../../manager/newest_free_books_cubit/newest_free_books_cubit.dart';
import '../widgets/Custom_widgets/custom_home_app_bar.dart';
import '../widgets/newest_free_books_list_view_bloc_builder.dart';
import '../widgets/book_cards_home_list_view_bloc_builder.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
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
    if (currentPositions >= 1 * maxScrollLength) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<NewestFreeBooksCubit>(context)
            .fetchNewestBooks(pageNumber: nextPage++);
        isLoading = false;
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // @override
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //fixed app bar
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: DimensionsOfScreen.dimensionsOfWidth(context, 2),
          ),
          child: const CustomHomeAppBar(),
        ),
        SizedBox(
          height: DimensionsOfScreen.dimensionsOfHeight(context, 88),
          child: CustomScrollView(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal:
                            DimensionsOfScreen.dimensionsOfWidth(context, 2),
                      ),
                      child: const Text(
                        "Free Books:",
                        style: Styles.textStyle18,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const BookCardsHomeListViewBlocBuilder(),
                    const SizedBox(
                      height: 36,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal:
                            DimensionsOfScreen.dimensionsOfWidth(context, 2),
                      ),
                      child: const Text(
                        "Newest Free Books :",
                        style: Styles.textStyle18,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
              const SliverToBoxAdapter(
                child: NewestFreeBooksListViewBlocBuilder(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
