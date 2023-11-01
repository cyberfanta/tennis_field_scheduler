import 'package:flutter/material.dart';
import 'package:tennis_field_scheduler/core/constants/ui_texts.dart';

class UiTextDelegate extends LocalizationsDelegate<UiTexts> {
  const UiTextDelegate();

  @override
  bool isSupported(Locale locale) => ["en", "es"].contains(locale.languageCode);

  @override
  Future<UiTexts> load(Locale locale) => UiTexts.load(locale);

  @override
  bool shouldReload(UiTextDelegate old) => false;
}
