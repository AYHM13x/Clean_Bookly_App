import 'package:flutter/material.dart';

import '../../core/utils/dimensions_of_screen.dart';
import 'presentation/views/bodies/edit_entry_view_body.dart';

class EditEntryView extends StatelessWidget {
  const EditEntryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            right: DimensionsOfScreen.dimensionsOfWidth(context, 2),
            left: DimensionsOfScreen.dimensionsOfWidth(context, 2),
          ),
          child: const EditEntryViewBody(),
        ),
      ),
    );
  }
}
