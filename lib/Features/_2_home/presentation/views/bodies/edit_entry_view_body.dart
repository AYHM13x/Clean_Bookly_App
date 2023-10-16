import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_widgets/custom_text_form_field.dart';

class EditEntryViewBody extends StatelessWidget {
  const EditEntryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomTextField(hintText: "free Books"),
        CustomTextField(hintText: "newest free Books")
      ],
    );
  }
}
