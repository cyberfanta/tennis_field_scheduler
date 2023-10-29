import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/entities/forecast.dart';
import '../../../data/repositories/repository.dart';

class WeatherForecastCubit extends Cubit<BaseForecast> {
  WeatherForecastCubit(this._repository) : super(BaseForecast.empty());

  final Repository _repository;

  Future<void> getForecast() async {
    final forecast = await _repository.getForecast();
    emit(forecast);
  }
}
