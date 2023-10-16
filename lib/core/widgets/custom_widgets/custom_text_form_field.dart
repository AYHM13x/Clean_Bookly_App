// ignore_for_file: must_be_immutable

import 'package:bookly_app/constents.dart';
import 'package:bookly_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.maxLines = 1,
    this.onChange,
    this.initValue = "",
  });

  final String hintText;
  final String initValue;
  final int maxLines;
  final void Function(String)? onChange;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initValue,
      validator: (data) {
        if (data!.isEmpty) {
          return "field is required";
        }
      },
      onChanged: onChange, //if i want to edit note
      cursorColor: AppColors.whiteColor, //color of cursor
      textAlign: TextAlign.left, //place of text
      maxLines: maxLines, //max of empty lines
      style: const TextStyle(
        color: AppColors.whiteColor, // color of typing text
      ),
      decoration: InputDecoration(
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Opacity(
            opacity: 0.8,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
          ),
        ),
        suffixIconColor: AppColors.whiteColor,
        //padding of content
        contentPadding: const EdgeInsets.symmetric(
          vertical: 30.0,
          horizontal: 20.0,
        ),
        hintText: hintText, //hint to user what field talking about
        hintStyle: const TextStyle(
          color: AppColors.greyColor,
        ),
        //border of text field
        border: rounderBorder(color: AppColors.whiteColor.withOpacity(0.8)),
        enabledBorder:
            rounderBorder(color: AppColors.whiteColor.withOpacity(0.8)),
        focusedBorder:
            rounderBorder(color: AppColors.orangeColor.withOpacity(0.7)),
      ),
    );
  }

  OutlineInputBorder rounderBorder({color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(kBorderRadiusValue),
      borderSide: BorderSide(color: color),
    );
  }
}
