import 'package:bookly_app/Features/_2_home/domain/entities/book_entity.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_widgets/custom_show_snackbar.dart';

Future<void> customLaunchUrl(BuildContext context, BookEntity book) async {
  final Uri url = Uri.parse(book.previewLink!);
  if (book.previewLink != null) {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  } else {
    customShowSnackBar(context, message: "Free Preview is Unavailable");
  }
}
