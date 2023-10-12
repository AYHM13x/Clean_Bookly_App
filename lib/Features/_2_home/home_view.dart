import 'package:flutter/material.dart';

import '../../core/utils/dimensions_of_screen.dart';
import 'presentation/views/bodies/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            right: DimensionsOfScreen.dimensionsOfWidth(context, 2),
            left: DimensionsOfScreen.dimensionsOfWidth(context, 2),
          ),
          child: const HomeViewBody(),
        ),
      ),
    );
  }
}
