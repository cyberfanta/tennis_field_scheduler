import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:tennis_field_scheduler/core/constants/ui_colors.dart';

class LoadingAnimationDialogs extends StatelessWidget {
  const LoadingAnimationDialogs({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: const LoadingIndicator(
        indicatorType: Indicator.ballRotateChase,
        colors: [cWhite, cGray, cBlack, cGray, cWhite],
        strokeWidth: 3.0,
      ),
    );
  }
}
