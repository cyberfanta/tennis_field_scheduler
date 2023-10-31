import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:tennis_field_scheduler/core/constants/ui_colors.dart';
import 'package:tennis_field_scheduler/core/static_data/static_data.dart';
import 'package:tennis_field_scheduler/presentation/common_widgets/ontap_wrapper.dart';

import '../../../core/constants/ui_text_styles.dart';
import '../../../core/constants/ui_texts.dart';
import '../../../core/tools/stamp.dart';
import '../../../data/entities/reserved_date.dart';
import '../../../domain/presenters/screens/reserved_date_cubit.dart';
import '../../../domain/presenters/screens/weather_forecast_cubit.dart';
import '../../common_widgets/background_templates/base_template.dart';
import '../../common_widgets/dialogs/lost_reserved_date_dialog.dart';
import '../../common_widgets/dialogs/reserved_date_saved_dialog.dart';
import '../../common_widgets/dialogs/weather_dialog.dart';

class AddDatesView extends StatefulWidget {
  const AddDatesView({super.key});

  static const routeName = '/AddDatesView';

  @override
  State<AddDatesView> createState() => _AddDatesViewState();
}

class _AddDatesViewState extends State<AddDatesView> {
  String tag =
      AddDatesView.routeName.substring(1, AddDatesView.routeName.length);
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseTemplate(
      tag: tag,
      content: buildContent(),
      backActionsToDo: backActions,
    );
  }

  Widget buildContent() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              OnTapWrapper(
                widgetToWrap: SvgPicture.asset(
                  "assets/images/back_arrow.svg",
                ),
                actionsToDo: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return LostReservedDateDialog(
                        tag: tag,
                      );
                    },
                  );
                },
              ),
              const SizedBox(width: 20),
              Text(
                UiTexts.of(context)!.creatingReservedSubTitle,
                style: styleRegular(16),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "${UiTexts.of(context)!.name}:",
                    style: styleRegular(14),
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: cYellow,
                    border: Border.all(color: cBlack, width: .5),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  constraints: const BoxConstraints(minHeight: 50),
                  alignment: Alignment.center,
                  child: TextField(
                    controller: nameController,
                    keyboardType: TextInputType.name,
                    style: styleRegular(14),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      isCollapsed: true,
                      border: InputBorder.none,
                      hintText: UiTexts.of(context)!.hintName,
                      hintStyle: styleRegular(14, cGrayDark),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "${UiTexts.of(context)!.field}:",
                    style: styleRegular(14),
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: cYellow,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: cBlack,
                      width: .5,
                    ),
                  ),
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    icon: const Icon(Icons.arrow_drop_down),
                    iconSize: 24,
                    elevation: 16,
                    style: styleRegular(14),
                    underline: Container(height: 0),
                    borderRadius: BorderRadius.circular(15),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 2,
                    ),
                    // isExpanded: true,
                    dropdownColor: cYellow,
                    iconEnabledColor: cBlack,
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items: items.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: styleRegular(14),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "${UiTexts.of(context)!.date}:",
                    style: styleRegular(14),
                  ),
                ),
                const SizedBox(height: 4),
                OnTapWrapper(
                  widgetToWrap: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: cYellow,
                      border: Border.all(color: cBlack, width: .5),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    child: Text(
                      "${selectedDate.year}-"
                      "${selectedDate.month < 10 ? "0${selectedDate.month}" : selectedDate.month}-"
                      "${selectedDate.day < 10 ? "0${selectedDate.day}" : selectedDate.day}",
                      style: styleRegular(16),
                    ),
                  ),
                  actionsToDo: () {
                    _selectDate(context);
                  },
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "${UiTexts.of(context)!.time}:",
                    style: styleRegular(14),
                  ),
                ),
                const SizedBox(height: 4),
                OnTapWrapper(
                  widgetToWrap: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: cYellow,
                      border: Border.all(color: cBlack, width: .5),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    child: Text(
                      selectedTime.hour == 0
                          ? "12 AM"
                          : selectedTime.hour < 12
                              ? "${selectedTime.hour} AM"
                              : selectedTime.hour == 12
                                  ? "12 PM"
                                  : "${selectedTime.hour - 12} PM",
                      style: styleRegular(16),
                    ),
                  ),
                  actionsToDo: () {
                    _selectTime(context);
                  },
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OnTapWrapper(
                      widgetToWrap: Column(
                        children: [
                          Text(
                            UiTexts.of(context)!.getWeather,
                            style: styleRegular(14),
                          ),
                          const SizedBox(height: 2),
                          SvgPicture.asset(
                            "assets/images/weather.svg",
                          ),
                        ],
                      ),
                      actionsToDo: () {
                        final cubit =
                            BlocProvider.of<WeatherForecastCubit>(context);

                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return WeatherDialog(
                              tag: tag,
                              cubit: cubit,
                              date: "${selectedDate.year}-"
                                  "${selectedDate.month < 10 ? "0${selectedDate.month}" : selectedDate.month}-"
                                  "${selectedDate.day < 10 ? "0${selectedDate.day}" : selectedDate.day}",
                              time: "${selectedTime.hour}",
                            );
                          },
                        );
                      },
                    ),
                    OnTapWrapper(
                      widgetToWrap: Container(
                        decoration: BoxDecoration(
                          color: cBlue,
                          border: Border.all(color: cBlack, width: .5),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 10,
                        ),
                        child: Text(
                          UiTexts.of(context)!.reserveDate,
                          style: styleBold(
                            16,
                            cWhite,
                          ),
                        ),
                      ),
                      actionsToDo: () {
                        ReservedDateCubit cubit =
                            Provider.of<ReservedDateCubit>(context,
                                listen: false);
                        List<ReservedDate> reservedDateList = cubit.state;

                        final reservedDate = ReservedDate(
                          id: "${reservedDateList.length}",
                          field: dropdownValue,
                          date:
                              "${UiTexts.of(context)!.date}: ${"${selectedDate.year}-"
                                  "${selectedDate.month < 10 ? "0${selectedDate.month}" : selectedDate.month}-"
                                  "${selectedDate.day < 10 ? "0${selectedDate.day}" : selectedDate.day}"} - "
                              "${UiTexts.of(context)!.time}: "
                              "${selectedTime.hour == 0 ? "12 AM" : selectedTime.hour < 12 ? "${selectedTime.hour} AM" : selectedTime.hour == 12 ? "12 PM" : "${selectedTime.hour - 12} PM"}",
                          owner: nameController.text,
                        );
                        context
                            .read<ReservedDateCubit>()
                            .addReservedDate(reservedDate);

                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return ReservedDateSavedDialog(
                              tag: tag,
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> backActions() async {
    stamp(tag, "Button Pressed: \"Back\"",
        decoratorChar: " * ", extraLine: true);
    viewManager.pop(context);
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }
}
