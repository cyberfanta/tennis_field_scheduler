import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/ui_colors.dart';
import '../../../core/constants/ui_text_styles.dart';
import '../../../core/constants/ui_texts.dart';
import '../../../core/tools/stamp.dart';
import '../../../data/entities/forecast.dart';
import '../../../domain/presenters/screens/weather_forecast_cubit.dart';
import '../animations/loading_animation_dialogs.dart';

enum WeatherDialogStatus { loading, success, error }

final getWeatherDialogStatusNotifier =
    ValueNotifier<WeatherDialogStatus>(WeatherDialogStatus.loading);

class WeatherDialog extends StatefulWidget {
  const WeatherDialog({
    super.key,
    required this.tag,
    required this.cubit,
    required this.date,
    required this.time,
  });

  final String tag;
  final WeatherForecastCubit cubit;
  final String date;
  final String time;

  @override
  State<WeatherDialog> createState() => _WeatherDialogState();
}

class _WeatherDialogState extends State<WeatherDialog> {
  String chanceOfRain = "";
  bool willItRain = false;
  String conditionIcon = "";
  String conditionText = "";
  String city = "";

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await widget.cubit.getForecast(widget.date, widget.time);
      final forecast = widget.cubit.state;
      final item = forecast.forecast!.forecastday![0].hour![0];

      chanceOfRain = "${item.chanceOfRain}";
      willItRain = item.willItRain == 1 ? true : false;
      conditionIcon = "${item.condition!.icon}";
      conditionText = "${item.condition!.text}";
      city = "${forecast.location!.name} - ${forecast.location!.country}";
      stamp(widget.tag, "Date: ${widget.date}");
      stamp(widget.tag, "Time: ${widget.time}");

      getWeatherDialogStatusNotifier.value = WeatherDialogStatus.success;
    });
  }

  @override
  Widget build(BuildContext context) {
    String pretend = "Weather Dialog:";
    stamp(widget.tag, "$pretend \"Opened\"", decoratorChar: " * ");

    return BlocProvider.value(
      value: widget.cubit,
      child: AlertDialog(
        backgroundColor: cBlue,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          side: BorderSide(
            width: .5,
            color: cBlack,
          ),
        ),
        actionsOverflowAlignment: OverflowBarAlignment.center,
        title: Text(
          UiTexts.of(context)!.getWeatherTitle,
          style: styleRegular(24, cWhite),
          textAlign: TextAlign.center,
        ),
        content: ValueListenableBuilder(
          valueListenable: getWeatherDialogStatusNotifier,
          builder: (context1, WeatherDialogStatus value, child) {
            switch (value) {
              case WeatherDialogStatus.loading:
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const LoadingAnimationDialogs(height: 50, width: 50),
                    const SizedBox(height: 8),
                    Text(
                      UiTexts.of(context)!.getWeatherContent,
                      maxLines: 2,
                      style: styleRegular(16, cWhite),
                      textAlign: TextAlign.center,
                    ),
                  ],
                );
              case WeatherDialogStatus.error:
                return Align(
                  alignment: Alignment.center,
                  child: Text(
                    UiTexts.of(context)!.errorLoading,
                    style: styleBold(24),
                    textAlign: TextAlign.center,
                  ),
                );
              default:
                return BlocBuilder<WeatherForecastCubit, BaseForecast>(
                  bloc: widget.cubit,
                  builder: (context, weatherForecast) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          city,
                          maxLines: 1,
                          style: styleRegular(16, cWhite),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        Image.network(
                          conditionIcon,
                          height: 80,
                          width: 80,
                          fit: BoxFit.contain,
                        ),
                        Text(
                          conditionText,
                          maxLines: 2,
                          style: styleRegular(16, cWhite),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "${UiTexts.of(context)!.getWeatherChanceOfRain} "
                          "$chanceOfRain%",
                          style: styleRegular(14, cWhite),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "${UiTexts.of(context)!.getWeatherWillItRain} "
                          "${willItRain ? UiTexts.of(context)!.getWeatherWillItRainYes : UiTexts.of(context)!.getWeatherWillItRainNo}",
                          style: styleRegular(14, cWhite),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    );
                  },
                );
            }
          },
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  stamp(widget.tag, "$pretend \"Closed\"",
                      decoratorChar: " * ", extraLine: true);
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  side: const BorderSide(width: 1.5, color: cBlack),
                  backgroundColor: cBackground,
                  padding: EdgeInsets.zero,
                  fixedSize: const Size(100, 30),
                ),
                child: Text(
                  UiTexts.of(context)!.getWeatherButton,
                  style: styleBold(13, cBlue),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
