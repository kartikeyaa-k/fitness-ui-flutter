extension StringExtensions on String {
  bool isNumeric(String? s) {
    if (s == null || s == '') {
      return false;
    }
    return double.tryParse(s) != null;
  }
}
