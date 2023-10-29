import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constants/ui_colors.dart';
import '../../../core/constants/ui_text_styles.dart';
import '../../../core/constants/ui_texts.dart';

class BaseTemplate extends StatelessWidget {
  const BaseTemplate({
    super.key,
    required this.tag,
    required this.content,
    required this.backActionsToDo,
    this.floatingAction,
  });

  final String tag;
  final Widget content;
  final Future<void> Function() backActionsToDo;
  final VoidCallback? floatingAction;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () async {
        await backActionsToDo();
        return true;
      },
      child: Scaffold(
        backgroundColor: cBackground,
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildAppTitle(context),
            Expanded(
              child: Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: SvgPicture.asset(
                      "assets/images/tennis_ball.svg",
                      width: min(height - 60, width) - 20,
                      alignment: Alignment.center,
                    ),
                  ),
                  content,
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: floatingAction != null
            ? FloatingActionButton(
                onPressed: floatingAction,
                backgroundColor: cBlue,
                child: const Icon(Icons.add),
              )
            : null,
      ),
    );
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
