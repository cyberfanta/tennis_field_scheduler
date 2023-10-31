import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tennis_field_scheduler/data/entities/reserved_date.dart';
import 'package:tennis_field_scheduler/domain/presenters/screens/reserved_date_cubit.dart';
import 'package:tennis_field_scheduler/presentation/views/screens/add_dates_view.dart';

import '../../../core/constants/ui_text_styles.dart';
import '../../../core/constants/ui_texts.dart';
import '../../../core/static_data/static_data.dart';
import '../../../core/tools/stamp.dart';
import '../../../domain/presenters/screens/weather_forecast_cubit.dart';
import '../../common_widgets/animations/loading_animation.dart';
import '../../common_widgets/background_templates/base_template.dart';
import '../../common_widgets/cards/reserved_date_card.dart';
import '../../common_widgets/dialogs/close_app_dialog.dart';
import '../../common_widgets/dialogs/delete_reserved_date_dialog.dart';
import '../../common_widgets/dialogs/weather_dialog.dart';

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
          const SizedBox(height: 8),
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
                              name: reservedDateList[index].owner,
                              weatherRequest: () async {
                                final List<String> dateTime =
                                    reservedDateList[index].date.split(" ");
                                final int timeRaw = int.parse(dateTime[4]) +
                                    (dateTime[5] == "PM" ? 12 : 0);

                                final cubit =
                                    BlocProvider.of<WeatherForecastCubit>(
                                        context);

                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return WeatherDialog(
                                      tag: tag,
                                      cubit: cubit,
                                      date: dateTime[1],
                                      time: "$timeRaw",
                                    );
                                  },
                                );
                              },
                              deleteRequest: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return DeleteReservedDateDialog(
                                      tag: tag,
                                      id: reservedDateList[index].id,
                                    );
                                  },
                                );
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

    dropdownValue = "${UiTexts.of(context)!.field} A";
    items = [
      "${UiTexts.of(context)!.field} A",
      "${UiTexts.of(context)!.field} B",
      "${UiTexts.of(context)!.field} C"
    ];

      selectedDate = DateTime.now();
      while (countReservations(selectedDate) >= 3) {
        selectedDate = selectedDate.add(const Duration(days: 1));
      }

    viewManager.push(context, AddDatesView.routeName);
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
