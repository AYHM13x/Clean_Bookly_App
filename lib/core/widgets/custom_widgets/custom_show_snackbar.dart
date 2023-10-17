import 'package:flutter/material.dart';

import '../../utils/styles.dart';

void customShowSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Center(
          child: Text(
        message,
        style: Styles.textStyle16,
      )),
    ),
  );
}
