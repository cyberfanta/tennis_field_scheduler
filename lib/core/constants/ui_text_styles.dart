import 'package:flutter/material.dart';
import 'package:tennis_field_scheduler/core/constants/ui_colors.dart';

const currentFontFamily = "LeagueSpartan";

TextStyle styleRegular([double? fontSize = 12, Color? color = cBlack]) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: FontWeight.w400,
    fontFamily: currentFontFamily,
  );
}

TextStyle styleRegularUnderline(
    [double? fontSize = 12, Color? color = cBlack]) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: FontWeight.w400,
    fontFamily: currentFontFamily,
    decoration: TextDecoration.underline,
  );
}

TextStyle styleMedium([double? fontSize = 12, Color? color = cBlack]) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: FontWeight.w600,
    fontFamily: currentFontFamily,
  );
}

TextStyle styleMediumUnderline([double? fontSize = 12, Color? color = cBlack]) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: FontWeight.w600,
    fontFamily: currentFontFamily,
    decoration: TextDecoration.underline,
  );
}

TextStyle styleBold([double? fontSize = 12, Color? color = cBlack]) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: FontWeight.w700,
    fontFamily: currentFontFamily,
  );
}

TextStyle styleBoldUnderline([double? fontSize = 12, Color? color = cBlack]) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: FontWeight.w700,
    fontFamily: currentFontFamily,
    decoration: TextDecoration.underline,
  );
}

TextStyle styleSemiBold([double? fontSize = 12, Color? color = cBlack]) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: FontWeight.w600,
    fontFamily: currentFontFamily,
  );
}

TextStyle styleSemiBoldUnderline(
    [double? fontSize = 12, Color? color = cBlack]) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: FontWeight.w600,
    fontFamily: currentFontFamily,
    decoration: TextDecoration.underline,
  );
}

TextStyle styleRegularOutline(
    [double? fontSize = 12,
    Color? color = cBlack,
    Color? colorOutline = cWhite,
    double? strokeWidth = 2]) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: FontWeight.w400,
    fontFamily: currentFontFamily,
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

TextStyle styleRegularOutlineUnderline(
    [double? fontSize = 12,
    Color? color = cBlack,
    Color? colorOutline = cWhite,
    double? strokeWidth = 2]) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: FontWeight.w400,
    fontFamily: currentFontFamily,
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

TextStyle styleBoldOutline(
    [double? fontSize = 12,
      Color? color = cBlack,
      Color? colorOutline = cWhite,
      double? strokeWidth = 2]) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: FontWeight.w700,
    fontFamily: currentFontFamily,
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

