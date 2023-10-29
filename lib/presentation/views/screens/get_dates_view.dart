import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constants/ui_colors.dart';
import '../../../core/constants/ui_text_styles.dart';
import '../../../core/constants/ui_texts.dart';
import '../../../core/tools/stamp.dart';

class GetDatesView extends StatefulWidget {
  const GetDatesView({super.key});

  static const routeName = '/GetDatesView';

  @override
  State<GetDatesView> createState() => _GetDatesViewState();
}

class _GetDatesViewState extends State<GetDatesView> {
  String tag = GetDatesView.routeName;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    stamp(tag, "height: $height");
    stamp(tag, "width: $width");

    Column viewList = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildAppTitle(context),
      ],
    );

    return viewList;
  }

  Container buildAppTitle(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        color: cBlue,
        border: Border.all(
          color: cBox2,
        ),
      ),
      constraints: const BoxConstraints(
        minHeight: 60,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                UiTexts.of(context)!.title,
                style: styleMedium(24, cWhite, "Acme"),
              ),
              const SizedBox(
                width: 10,
              ),
              SvgPicture.asset(
                "assets/images/tennis_ball_with_shadow.svg",
                height: 40,
              ),
            ],
          ),
          SvgPicture.asset(
            "assets/images/hamburger.svg",
            height: 40,
          ),
        ],
      ),
    );
  }
}
