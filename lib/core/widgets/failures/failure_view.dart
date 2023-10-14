import 'package:flutter/material.dart';

import '../../utils/styles.dart';

class FailureView extends StatelessWidget {
  const FailureView({
    super.key,
    required this.errMessage,
  });

  final String errMessage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errMessage,
        style: Styles.textStyle20,
      ),
    );
  }
}