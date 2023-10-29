import 'package:shared_preferences/shared_preferences.dart';

import '../../core/static_data/shared_preferences_constants.dart';
import '../entities/forecast.dart';
import '../entities/reserved_date.dart';
import 'api/api.dart';

class Repository {
  Repository(this._api);

  late final Api _api;

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

  Future<BaseForecast> getForecast() {
    return _api.getForecast();
  }
}
