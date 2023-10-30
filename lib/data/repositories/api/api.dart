import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../core/static_data/api_constants.dart';
import '../../entities/forecast.dart';

class Api {
  Future<BaseForecast> getForecast(String date, String time) async {
    final response = await http.get(
      Uri.parse(
          "$baseApiUrl$forecastUrl?q=$defaultCity&days=$defaultAmountOfDays&dt=$date&hour=$time&key=$apiKey"),
      // headers: {
      //   "bearer token": apiKey,
      // },
    );

    if (response.statusCode == 200) {
      return BaseForecast.fromJson(jsonDecode(response.body));
    }

    return BaseForecast.empty();
  }
}
