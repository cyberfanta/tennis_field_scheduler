import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../entities/forecast.dart';

class Api {
  Future<BaseForecast> getForecast() async {
    final response = await http.get(Uri.parse('https://google.com'));

    if (response.statusCode == 200) {
      return BaseForecast.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error al cargar el pronóstico');
    }
  }
}
