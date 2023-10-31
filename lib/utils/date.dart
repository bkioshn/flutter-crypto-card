import 'package:intl/intl.dart';

String formatDateTime(DateTime dateTime) {
  final DateFormat formatter = DateFormat('dd-MM-yyyy HH:mm:ss');
  return formatter.format(dateTime.toLocal());
}
