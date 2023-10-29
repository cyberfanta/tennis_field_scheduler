import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tennis_field_scheduler/core/constants/ui_text_styles.dart';

import '../../../core/constants/ui_colors.dart';
import '../ontap_wrapper.dart';

class ReservedDateCard extends StatelessWidget {
  const ReservedDateCard({
    super.key,
    required this.field,
    required this.date,
    required this.weatherRequest,
    required this.deleteRequest,
  });

  final String field;
  final String date;
  final VoidCallback weatherRequest;
  final VoidCallback deleteRequest;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: cWhite,
        border: Border.all(width: .5, color: cBlack),
        borderRadius: BorderRadius.circular(20),
      ),
      // margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                field,
                style: styleRegular(16),
              ),
              Text(
                date,
                style: styleRegular(14),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OnTapWrapper(
                widgetToWrap: SvgPicture.asset(
                  "assets/images/weather.svg",
                  height: 20,
                  alignment: Alignment.center,
                ),
                actionsToDo: weatherRequest,
              ),
              const SizedBox(height: 8),
              OnTapWrapper(
                widgetToWrap: SvgPicture.asset(
                  "assets/images/delete.svg",
                  height: 15,
                  alignment: Alignment.center,
                ),
                actionsToDo: deleteRequest,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
