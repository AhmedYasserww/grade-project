import 'package:intl/intl.dart';

String formatDate(String date) {
  try {
    final dateTime = DateTime.parse(date);
    return DateFormat('dd-MM-yyyy hh:mm a').format(dateTime);
  } catch (e) {
    return 'Invalid date';
  }
}
