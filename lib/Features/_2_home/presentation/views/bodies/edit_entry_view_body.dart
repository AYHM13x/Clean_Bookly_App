import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_widgets/custom_text_form_field.dart';

class EditEntryViewBody extends StatelessWidget {
  const EditEntryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          hintText: "free Books",
          onChange: (p0) {},
        ),
        CustomTextField(
          hintText: "newest free Books",
          onChange: (p0) {},
        )
      ],
    );
  }
}
