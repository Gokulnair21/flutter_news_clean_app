import 'package:intl/intl.dart';

extension StringUtils on String {
  String capitalize() {
    if (isNotEmpty) {
      return substring(0, 1).toUpperCase() + substring(1);
    }
    return this;
  }

  String formatDate({String dateFormat = "dd MMM yyyy"}) {
    final dateTime = DateTime.parse(this);
    final format = DateFormat(dateFormat);
    return format.format(dateTime);
  }
}
