extension toUpperCaseOfFirstLetter on String {
  String toUpperCaseFirstLetter() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}
