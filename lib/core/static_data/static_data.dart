import '../tools/view_manager.dart';

ViewManager viewManager = ViewManager();
String dropdownValue = "";
List<String> items = [];
List<String> dateList = [];
DateTime selectedDate = DateTime.now();
String authorLinkedin =
    "https://www.linkedin.com/in/julio-c%C3%A9sar-alberto-le%C3%B3n-anhuam%C3%A1n-a803572b/";

int countReservations(DateTime date) {
  return dateList
      .where((r) => DateTime.parse(r.split(' ')[1]).day == date.day)
      .length;
}
