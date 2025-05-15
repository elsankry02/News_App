import 'package:intl/intl.dart';

String formatDate(String dateString) {
  // Parse the string to a DateTime object
  DateTime date = DateTime.parse(dateString);

  // Format the DateTime object to the desired format
  return DateFormat('MMM d, yyyy').format(date);
}
