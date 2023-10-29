import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UiTexts {
  UiTexts(this.locale);

  final Locale locale;

  static UiTexts? of(BuildContext context) {
    return Localizations.of<UiTexts>(context, UiTexts);
  }

  static Future<UiTexts> load(Locale locale) {
    return SynchronousFuture<UiTexts>(UiTexts(locale));
  }

  String get title {
    return Intl.message(
      "Tennis Field Scheduler",
      name: "title",
      locale: locale.toString(),
    );
  }
}
