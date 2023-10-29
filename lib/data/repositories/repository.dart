import 'package:shared_preferences/shared_preferences.dart';

import '../../core/static_data/shared_preferences_constants.dart';
import '../entities/reserved_date.dart';

class Repository {
  Future<List<ReservedDate>> loadReservedDates() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getStringList(sharedPreferenceReservations) ?? [];
    return data.map((str) => ReservedDate.fromJson(str)).toList();
  }

  Future<void> saveReservedDate(List<ReservedDate> reservedDatesList) async {
    final prefs = await SharedPreferences.getInstance();
    final data = reservedDatesList.map((reservedDate) => reservedDate.toJson()).toList();
    await prefs.setStringList(sharedPreferenceReservations, data);
  }
}
