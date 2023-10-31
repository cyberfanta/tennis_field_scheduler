import 'package:intl/intl.dart';

DateTime parseDateTime(String dateStr) {
  final datePart = dateStr.split(' - ')[0].split(': ')[1];
  final timePart = dateStr.split(' - ')[1].split(': ')[1];

  final dateFormat = DateFormat('yyyy-MM-dd h a');
  return dateFormat.parse('$datePart $timePart');
}
