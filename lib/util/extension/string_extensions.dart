extension StringUtils on String {
  String capitalize() {
    if (isNotEmpty) {
      return substring(0, 1).toUpperCase() + substring(1);
    }
    return this;
  }
}
