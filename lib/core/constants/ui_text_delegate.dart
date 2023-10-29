import 'package:flutter/material.dart';
import 'package:tennis_field_scheduler/core/constants/ui_texts.dart';

class UxTextDelegate extends LocalizationsDelegate<UiTexts> {
  const UxTextDelegate();

  @override
  bool isSupported(Locale locale) => ["en", "es"].contains(locale.languageCode);

  @override
  Future<UiTexts> load(Locale locale) => UiTexts.load(locale);

  @override
  bool shouldReload(UxTextDelegate old) => false;
}
