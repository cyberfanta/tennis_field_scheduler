import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tennis_field_scheduler/data/entities/forecast.dart';
import 'package:tennis_field_scheduler/domain/presenters/screens/weather_forecast_cubit.dart';

import 'reserved_date_cubit_test.dart';

void main() {
  late MockRepository mockRepository;
  late WeatherForecastCubit cubit;

  setUp(() {
    mockRepository = MockRepository();
    cubit = WeatherForecastCubit(mockRepository);
  });

  tearDown(() {
    cubit.close();
  });

  test('emits BaseForecast.empty() when created', () {
    expect(cubit.state, BaseForecast.empty());
  });

  group('getForecast', () {
    const date = '2023-10-30';
    const time = '10 PM';
    final forecast = BaseForecast.empty();

    blocTest<WeatherForecastCubit, BaseForecast>(
      'emits [forecast] when getForecast succeeds',
      build: () {
        when(mockRepository.getForecast(date, time))
            .thenAnswer((_) async => forecast);
        return cubit;
      },
      act: (cubit) => cubit.getForecast(date, time),
      expect: () => [forecast],
    );
  });
}
