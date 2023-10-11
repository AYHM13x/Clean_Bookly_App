import 'package:flutter/material.dart';

import '../../../constents.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.style,
    required this.backgroundColor,
    this.onPressed,
    this.borderRadius,
  });
  final String text;
  final TextStyle style;
  final Color backgroundColor;
  final BorderRadius? borderRadius;
  final void Function()? onPressed;
  final double height = 48;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius:
                borderRadius ?? BorderRadius.circular(kBorderRadiusValue),
          ),
        ),
        child: Text(
          text,
          style: style,
        ),
      ),
    );
  }
}
