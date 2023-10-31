import '../tools/view_manager.dart';

ViewManager viewManager = ViewManager();
String dropdownValue = "";
List<String> items = [];
List<String> dateList = [];
DateTime selectedDate = DateTime.now();

int countReservations(DateTime date) {
  return dateList
      .where((r) => DateTime.parse(r.split(' ')[1]).day == date.day)
      .length;
}
