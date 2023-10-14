import 'package:bookly_app/core/utils/dimensions_of_screen.dart';
import 'package:flutter/material.dart';

import 'bodies/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: DimensionsOfScreen.dimensionsOfHeight(context, 2),
            left: DimensionsOfScreen.dimensionsOfWidth(context, 4),
            right: DimensionsOfScreen.dimensionsOfWidth(context, 4),
          ),
          child: const SearchViewBody(),
        ),
      ),
    );
  }
}
