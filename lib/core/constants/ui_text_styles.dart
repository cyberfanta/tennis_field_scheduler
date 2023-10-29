import 'package:flutter/material.dart';
import 'package:tennis_field_scheduler/core/constants/ui_colors.dart';

const String currentFontFamily = "Lato";

TextStyle styleRegular([
  double? fontSize = 12,
  Color? color = cBlack,
  String? fontFamily = currentFontFamily,
]) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: FontWeight.w400,
    fontFamily: fontFamily,
  );
}

TextStyle styleRegularUnderline([
  double? fontSize = 12,
  Color? color = cBlack,
  String? fontFamily = currentFontFamily,
]) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: FontWeight.w400,
    fontFamily: fontFamily,
    decoration: TextDecoration.underline,
  );
}

TextStyle styleMedium([
  double? fontSize = 12,
  Color? color = cBlack,
  String? fontFamily = currentFontFamily,
]) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: FontWeight.w600,
    fontFamily: fontFamily,
  );
}

TextStyle styleMediumUnderline([
  double? fontSize = 12,
  Color? color = cBlack,
  String? fontFamily = currentFontFamily,
]) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: FontWeight.w600,
    fontFamily: fontFamily,
    decoration: TextDecoration.underline,
  );
}

TextStyle styleBold([
  double? fontSize = 12,
  Color? color = cBlack,
  String? fontFamily = currentFontFamily,
]) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
  );
}

TextStyle styleBoldUnderline([
  double? fontSize = 12,
  Color? color = cBlack,
  String? fontFamily = currentFontFamily,
]) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
    decoration: TextDecoration.underline,
  );
}

TextStyle styleSemiBold([
  double? fontSize = 12,
  Color? color = cBlack,
  String? fontFamily = currentFontFamily,
]) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: FontWeight.w600,
    fontFamily: fontFamily,
  );
}

TextStyle styleSemiBoldUnderline([
  double? fontSize = 12,
  Color? color = cBlack,
  String? fontFamily = currentFontFamily,
]) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: FontWeight.w600,
    fontFamily: fontFamily,
    decoration: TextDecoration.underline,
  );
}

TextStyle styleRegularOutline([
  double? fontSize = 12,
  Color? color = cBlack,
  Color? colorOutline = cWhite,
  double? strokeWidth = 2,
  String? fontFamily = currentFontFamily,
]) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: FontWeight.w400,
    fontFamily: fontFamily,
    shadows: [
      Shadow(
        offset: Offset(-(strokeWidth ?? 2), -(strokeWidth ?? 2)),
        color: colorOutline ?? cWhite,
      ),
      Shadow(
        offset: Offset((strokeWidth ?? 2), -(strokeWidth ?? 2)),
        color: colorOutline ?? cWhite,
      ),
      Shadow(
        offset: Offset((strokeWidth ?? 2), (strokeWidth ?? 2)),
        color: colorOutline ?? cWhite,
      ),
      Shadow(
        offset: Offset(-(strokeWidth ?? 2), (strokeWidth ?? 2)),
        color: colorOutline ?? cWhite,
      ),
    ],
  );
}

TextStyle styleRegularOutlineUnderline([
  double? fontSize = 12,
  Color? color = cBlack,
  Color? colorOutline = cWhite,
  double? strokeWidth = 2,
  String? fontFamily = currentFontFamily,
]) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: FontWeight.w400,
    fontFamily: fontFamily,
    decoration: TextDecoration.underline,
    shadows: [
      Shadow(
        offset: Offset(-(strokeWidth ?? 2), -(strokeWidth ?? 2)),
        color: colorOutline ?? cWhite,
      ),
      Shadow(
        offset: Offset((strokeWidth ?? 2), -(strokeWidth ?? 2)),
        color: colorOutline ?? cWhite,
      ),
      Shadow(
        offset: Offset((strokeWidth ?? 2), (strokeWidth ?? 2)),
        color: colorOutline ?? cWhite,
      ),
      Shadow(
        offset: Offset(-(strokeWidth ?? 2), (strokeWidth ?? 2)),
        color: colorOutline ?? cWhite,
      ),
    ],
  );
}

TextStyle styleBoldOutline([
  double? fontSize = 12,
  Color? color = cBlack,
  Color? colorOutline = cWhite,
  double? strokeWidth = 2,
  String? fontFamily = currentFontFamily,
]) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
    shadows: [
      Shadow(
        offset: Offset(-(strokeWidth ?? 2), -(strokeWidth ?? 2)),
        color: colorOutline ?? cWhite,
      ),
      Shadow(
        offset: Offset((strokeWidth ?? 2), -(strokeWidth ?? 2)),
        color: colorOutline ?? cWhite,
      ),
      Shadow(
        offset: Offset((strokeWidth ?? 2), (strokeWidth ?? 2)),
        color: colorOutline ?? cWhite,
      ),
      Shadow(
        offset: Offset(-(strokeWidth ?? 2), (strokeWidth ?? 2)),
        color: colorOutline ?? cWhite,
      ),
    ],
  );
}
