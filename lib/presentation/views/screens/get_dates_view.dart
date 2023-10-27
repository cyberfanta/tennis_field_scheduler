import 'package:flutter/material.dart';

import '../../../core/constants/ui_colors.dart';
import '../../../core/constants/ui_text_styles.dart';

class GetDatesView extends StatefulWidget {
  const GetDatesView({super.key});

  static const routeName = '/GetDatesView';

  @override
  State<GetDatesView> createState() => _GetDatesViewState();
}

class _GetDatesViewState extends State<GetDatesView> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    Column viewList = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: height * .1,
          width: double.infinity,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(
            horizontal: width * .02,
            vertical: height * .02,
          ),
          decoration: BoxDecoration(
            color: cBlue,
            border: Border.all(
              color: cBox2,
            ),
          ),
          // constraints: BoxConstraints(
          //   minHeight: height * .1,
          // ),
          child: Text(
            "Tennis Field Scheduler",
            style: styleMedium(24, cWhite),
          ),
        ),
      ],
    );

    return viewList;
  }
}
