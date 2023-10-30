import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:tennis_field_scheduler/data/entities/reserved_date.dart';
import 'package:tennis_field_scheduler/domain/presenters/screens/reserved_date_cubit.dart';

import '../../../core/constants/ui_text_styles.dart';
import '../../../core/constants/ui_texts.dart';
import '../../../core/tools/stamp.dart';
import '../../../domain/presenters/screens/weather_forecast_cubit.dart';
import '../../common_widgets/animations/loading_animation.dart';
import '../../common_widgets/background_templates/base_template.dart';
import '../../common_widgets/cards/reserved_date_card.dart';
import '../../common_widgets/dialogs/close_app_dialog.dart';

enum GetDatesViewStatus { loading, success, error }

final getDatesViewStatusNotifier =
    ValueNotifier<GetDatesViewStatus>(GetDatesViewStatus.loading);

class GetDatesView extends StatefulWidget {
  const GetDatesView({super.key});

  static const routeName = '/GetDatesView';

  @override
  State<GetDatesView> createState() => _GetDatesViewState();
}

class _GetDatesViewState extends State<GetDatesView> {
  String tag =
      GetDatesView.routeName.substring(1, GetDatesView.routeName.length);

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await context.read<ReservedDateCubit>().loadReservedDates();
      getDatesViewStatusNotifier.value = GetDatesViewStatus.success;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseTemplate(
      tag: tag,
      content: buildContent(),
      backActionsToDo: backActions,
      floatingAction: floatingAction,
    );
  }

  Widget buildContent() {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double loadingSize = min(height - 60, width) - 20;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            UiTexts.of(context)!.getDatesSubTitle,
            style: styleRegular(16),
          ),
          const SizedBox(
            height: 8,
          ),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: getDatesViewStatusNotifier,
              builder: (context1, GetDatesViewStatus value, child) {
                switch (value) {
                  case GetDatesViewStatus.loading:
                    return Align(
                      alignment: Alignment.center,
                      child: LoadingAnimation(
                        height: loadingSize,
                        width: loadingSize,
                      ),
                    );
                  case GetDatesViewStatus.error:
                    return Align(
                      alignment: Alignment.center,
                      child: Text(
                        UiTexts.of(context)!.errorLoading,
                        style: styleBold(24),
                        textAlign: TextAlign.center,
                      ),
                    );
                  default:
                    return BlocBuilder<ReservedDateCubit, List<ReservedDate>>(
                      builder: (context, reservedDateList) {
                        return ListView.separated(
                          itemCount: reservedDateList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ReservedDateCard(
                              field: reservedDateList[index].field,
                              date: reservedDateList[index].date,
                              weatherRequest: () async {
                                final List<String> dateTime =
                                    reservedDateList[index].date.split(" ");
                                final List<String> timeRaw =
                                    dateTime[3].split(":");

                                final cubit =
                                    BlocProvider.of<WeatherForecastCubit>(
                                        context);
                                await cubit.getForecast(
                                    dateTime[2], timeRaw[0]);
                                final forecast = cubit.state;
                                final item =
                                    forecast.forecast!.forecastday![0].hour![0];

                                stamp(tag,
                                    "Forecast: chanceOfRain: ${item.chanceOfRain} - willItRain: ${item.willItRain == 1 ? true : false}");
                              },
                              deleteRequest: () {
                                context
                                    .read<ReservedDateCubit>()
                                    .deleteReservedDate(
                                        reservedDateList[index].id);
                              },
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(height: 10);
                          },
                        );
                      },
                    );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  void floatingAction() {
    stamp(tag, "Action: \"Add\"", decoratorChar: " * ", extraLine: true);

    ReservedDateCubit cubit =
        Provider.of<ReservedDateCubit>(context, listen: false);
    List<ReservedDate> reservedDateList = cubit.state;

    if (reservedDateList.length < 5) {
      final reservedDate = ReservedDate(
          id: "${reservedDateList.length}",
          field: "Field: A + ${reservedDateList.length}",
          date: "Date: 2023/10/30 - 11:00am");
      context.read<ReservedDateCubit>().addReservedDate(reservedDate);
    } else {
      context.read<ReservedDateCubit>().deleteReservedDate("0");
      context.read<ReservedDateCubit>().deleteReservedDate("1");
      context.read<ReservedDateCubit>().deleteReservedDate("2");
      context.read<ReservedDateCubit>().deleteReservedDate("3");
      context.read<ReservedDateCubit>().deleteReservedDate("4");
    }
  }

  Future<void> backActions() async {
    stamp(tag, "Button Pressed: \"Back\"",
        decoratorChar: " * ", extraLine: true);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CloseAppDialog(
          tag: tag,
        );
      },
    );
  }
}
