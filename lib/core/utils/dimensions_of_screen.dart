import 'package:flutter/material.dart';

class DimensionsOfScreen {
  static double dimensionsOfWidth(BuildContext context, double percent) {
    return MediaQuery.of(context).size.width * percent / 100;
  }

  static double dimensionsOfHeight(BuildContext context, double percent) {
    return MediaQuery.of(context).size.height * percent / 100;
  }
}
