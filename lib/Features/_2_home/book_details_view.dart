import 'package:flutter/material.dart';

import '../../core/utils/dimensions_of_screen.dart';
import 'presentation/views/bodies/book_details_view_body.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            right: DimensionsOfScreen.dimensionsOfWidth(context, 4),
            left: DimensionsOfScreen.dimensionsOfWidth(context, 4),
          ),
          child: const BookDetailsViewBodyNewVersion(),
        ),
      ),
    );
  }
}


//  padding: EdgeInsets.only(
//           bottom: DimensionsOfScreen.dimensionsOfHeight(context, 0),
//           top: DimensionsOfScreen.dimensionsOfHeight(context, 2),
//           right: DimensionsOfScreen.dimensionsOfWidth(context, 5),
//           left: DimensionsOfScreen.dimensionsOfWidth(context, 5),
//         ),