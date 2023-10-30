import 'package:shared_preferences/shared_preferences.dart';

import '../../core/static_data/shared_preferences_constants.dart';
import '../entities/forecast.dart';
import '../entities/reserved_date.dart';
import 'api/api.dart';

class Repository {
  Repository({Api? api}) : _api = api ?? Api();

  final Api _api;

  Future<List<ReservedDate>> loadReservedDates() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> data =
        prefs.getStringList(sharedPreferenceReservations) ?? [];
    return data.map((str) => ReservedDate.fromJson(str)).toList();
  }

  Future<void> saveReservedDate(List<ReservedDate> reservedDatesList) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> data =
        reservedDatesList.map((reservedDate) => reservedDate.toJson()).toList();
    await prefs.setStringList(sharedPreferenceReservations, data);
  }

  Future<BaseForecast> getForecast(String date, String time) {
    return _api.getForecast(date, time);
  }
}
