import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_widgets/custom_search_text_field.dart';
import '../widgets/search_books_list_view.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomSearchTextField(
          hintText: "Search",
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          "Search Result:",
          style: Styles.textStyle18,
        ),
        SizedBox(
          height: 16,
        ),
        Expanded(
          child: BookListView(),
        )
      ],
    );
  }
}
